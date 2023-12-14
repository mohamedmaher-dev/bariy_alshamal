// ignore_for_file: depend_on_referenced_packages, unnecessary_import, use_build_context_synchronously
import 'package:bariy_alshamal/core/utils/app_manger.dart';
import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/core/utils/popup_loading_manger.dart';
import 'package:bariy_alshamal/core/utils/print.dart';
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
                    bank: (
                      accountName: "null",
                      accountNum: "null",
                      bankName: "null",
                      screenUrl:
                          "null" //await cartRebo.uploadImage(file: bankInvoive!),
                    ),
                    orderInfo: (
                      orderID: cartRebo.createOrderID(),
                      orderprice: totalPrice
                    ),
                    promoCode: (discount: promoCodeValue, promoCodeID: null),
                    items: cartRebo.getProducts(cartItems: cartItems),
                    location: myLocation!,
                    userCity: await cartRebo.getUserCity(),
                  );
                  await cartRebo.deleteCart(cartItems: cartItems);
                  await getCartItems(emit);
                  PopUpLoading.success("تم تأكيد الطلب بنجاح");
                } catch (e) {
                  PopUpLoading.error("حدث خطأ ما");
                  DebugPrint.error(e.toString());
                }
                PopUpLoading.dismiss();
              } else {
                PopUpLoading.error(
                  "برجاء التأكد من تحديد الموقع و معلومات الدفع",
                );
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
          case PickBankInvoive():
            {
              // bankInvoive = await cartRebo.pickImage();
              // if (bankInvoive != null) {
              //   PopUpLoading.success("تم اختيار الصورة بنجاح");
              // }
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
