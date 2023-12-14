// ignore_for_file: depend_on_referenced_packages, unnecessary_import, use_build_context_synchronously

import 'package:bariy_alshamal/core/utils/popup_loading_manger.dart';
import 'package:bariy_alshamal/features/one_product/data/rebos/one_product_rebo.dart';
import 'package:bariy_alshamal/features/one_product/data/rebos/rebos/one_product_remote_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../products/data/models/product_model.dart';

part 'one_product_event.dart';
part 'one_product_state.dart';

class OneProductBloc extends Bloc<OneProductEvent, OneProductState> {
  OneProductRebo oneProductRebo = OneProductRemoteRebo();
  TextEditingController noteController = TextEditingController();
  late ProductModel productModel;
  int totlaPrice = 0;
  int count = 1;
  ({String? details, int price}) size = (details: null, price: 0);
  ({String? details, int price}) cuttings = (details: null, price: 0);
  ({String? details, int price}) packages = (details: null, price: 0);
  ({String? details, int price}) mafroum = (details: null, price: 0);
  ({String? details, int price}) head = (details: null, price: 0);

  OneProductBloc() : super(OneProductInitial()) {
    on<OneProductEvent>(
      (event, emit) async {
        switch (event) {
          case OneProductInitEvent():
            {
              noteController.clear();
              totlaPrice = 0;
              count = 1;
              size = (details: null, price: 0);
              cuttings = (details: null, price: 0);
              packages = (details: null, price: 0);
              mafroum = (details: null, price: 0);
              head = (details: null, price: 0);
              calcTotalPrice();
              emit(OneProductInitial());
            }

            break;
          case SizeSelect():
            {
              size = (
                details: productModel.size.list[event.index].details,
                price: productModel.size.list[event.index].price,
              );
            }
            break;
          case SizeDelete():
            {
              {
                size = (
                  details: null,
                  price: 0,
                );
              }
            }
            break;
          case PackgesSelect():
            {
              packages = (
                details: productModel.package.list[event.index].details,
                price: productModel.package.list[event.index].price,
              );
            }
            break;
          case PackgesDelete():
            {
              {
                packages = (
                  details: null,
                  price: 0,
                );
              }
            }
            break;
          case CuttingsSelect():
            {
              cuttings = (
                details: productModel.cut.list[event.index].details,
                price: productModel.cut.list[event.index].price,
              );
            }
            break;
          case CuttingsDelete():
            {
              {
                cuttings = (
                  details: null,
                  price: 0,
                );
              }
            }
            break;
          case MafroumSelect():
            {
              mafroum = (
                details: productModel.mafroum.list[event.index].details,
                price: productModel.mafroum.list[event.index].price
              );
            }
            break;
          case MafroumDelete():
            {
              {
                mafroum = (
                  details: null,
                  price: 0,
                );
              }
            }
            break;
          case HeadSelect():
            {
              head = (
                details: productModel.head.list[event.index].details,
                price: productModel.head.list[event.index].price,
              );
            }
            break;
          case HeadDelete():
            {
              {
                head = (
                  details: null,
                  price: 0,
                );
              }
            }
            break;
          case IncreaseCount():
            {
              count++;
            }
            break;

          case DecreaseCount():
            {
              if (count > 1) {
                count--;
              }
            }
            break;
          case AddOrderToCart():
            {
              PopUpLoading.loading();
              try {
                await oneProductRebo.addOrderToCart(
                  productName: productModel.productName,
                  count: count,
                  totalPrice: totlaPrice,
                  note: noteController.text,
                  size: size.details,
                  cut: cuttings.details,
                  package: packages.details,
                  mafroum: mafroum.details,
                  head: head.details,
                );
                PopUpLoading.success("تم اضافة المنتج الي السلة");
                Navigator.of(event.context).pop();
              } catch (e) {
                PopUpLoading.error("حدث خطأ ما");
              }
            }
            break;
        }
        calcTotalPrice();
        emit(OneProductInitial());
      },
    );
  }

  calcTotalPrice() {
    totlaPrice = (productModel.productPrice +
            size.price +
            cuttings.price +
            packages.price +
            mafroum.price +
            head.price) *
        count;
  }
}
