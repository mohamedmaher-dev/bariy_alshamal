// ignore_for_file: depend_on_referenced_packages, unnecessary_import, use_build_context_synchronously

import 'package:bariy_alshamal/core/utils/app_manger.dart';
import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/core/utils/popup_loading_manger.dart';
import 'package:bariy_alshamal/features/cart/data/models/cart_item_list_model.dart';
import 'package:bariy_alshamal/features/cart/data/rebos/cart_rebo.dart';
import 'package:bariy_alshamal/features/cart/data/rebos/rebos/cart_remote_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartRebo cartRebo = CartRemoteRebo();
  TextEditingController promoCodeController = TextEditingController();
  late CartItemListModel cartItems;
  late ({String code, bool isActive, int value})? promoCode;
  int totalPrice = 0;
  int promoCodeValue = 0;
  LatLng? myLocation;
  late String userName;
  CartBloc() : super(CartInitial()) {
    on<CartEvent>(
      (event, emit) async {
        switch (event) {
          case CartInitEvent():
            {
              if (AppManger.isLogin) {
                await getCartItems(emit);
              } else {
                emit(CartNeedLogin());
              }
            }
            break;
          case DeleteCartItem():
            {
              PopUpLoading.loading();
              try {
                await cartRebo.deleteCartItem(
                  cartItemID: cartItems.list[event.index].cartItemID!,
                );
              } catch (e) {
                PopUpLoading.error("حدث خطأ ما");
              }
              PopUpLoading.dismiss();
              await getCartItems(emit);
            }
            break;
          case ConfirmCart():
            {
              if (myLocation != null) {
                PopUpLoading.loading();
                try {
                  await cartRebo.addOrder(
                    cartItems: cartItems,
                    itemCount: cartItems.list.length,
                    promoCodeValue: promoCodeValue,
                    promoCode: promoCode == null ? null : promoCode!.code,
                    location: myLocation!,
                  );
                  try {
                    await cartRebo.deleteCart(cartItems: cartItems);
                  } catch (e) {
                    PopUpLoading.error("حدث خطأ ما");
                  }
                  await getCartItems(emit);
                  PopUpLoading.success("تم تأكيد الطلب بنجاح");
                } catch (e) {
                  PopUpLoading.error("حدث خطأ ما");
                }
                PopUpLoading.dismiss();
              } else {
                PopUpLoading.error("برجاء تحديد الموقع");
              }
            }
            break;
          case GoToLogin():
            {
              AppRoute.push(context: event.context, page: Pages.signIn);
            }
          case UsePromoCode():
            {
              if (promoCodeController.text.isEmpty) {
                promoCodeValue = 0;
                PopUpLoading.error("برجاء كتابة الكود");
              } else {
                PopUpLoading.loading();
                try {
                  promoCode = await cartRebo.getPromoCode(
                    code: promoCodeController.text,
                  );
                  if (promoCode != null) {
                    if (promoCode!.isActive) {
                      promoCodeValue = promoCode!.value;
                      PopUpLoading.success(
                        "تم استخدام كود الخصم بنجاح بقيمة $promoCodeValue ريال سعودي",
                      );
                    } else {
                      promoCodeValue = 0;
                      PopUpLoading.error("تم استخدام هذا الكود من قبل");
                    }
                  } else {
                    promoCodeValue = 0;
                    PopUpLoading.error("لا يوجد كود خصم بهذا الاسم");
                  }
                } catch (e) {
                  promoCodeValue = 0;
                  PopUpLoading.error("حدث خطأ ما");
                }
              }
              await getCartItems(emit);
            }
            break;
        }
      },
    );
  }

  Future<void> getCartItems(Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      cartItems = CartItemListModel.fromList(
        data: await cartRebo.getCartItems(),
      );
      if (cartItems.list.isEmpty) {
        emit(CartEmpty());
      } else {
        totalPrice = calcTotalPrice();
        emit(CartSuccess());
      }
    } catch (e) {
      emit(CartFailed());
    }
  }

  int calcTotalPrice() {
    int result = 0;
    for (var element in cartItems.list) {
      result = result + element.totalPrice;
    }
    return result - promoCodeValue;
  }
}
