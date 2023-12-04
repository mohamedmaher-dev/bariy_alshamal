// ignore_for_file: depend_on_referenced_packages, unnecessary_import

import 'dart:io';

import 'package:bariy_alshamal/core/utils/popup_loading_manger.dart';
import 'package:bariy_alshamal/features/admin/add_product/data/rebos/add_produc_rebo.dart';
import 'package:bariy_alshamal/features/admin/add_product/data/rebos/rebos/add_product_remote_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductRebo addProductRebo = AddProductRemoteRebo();
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productDetails = TextEditingController();
  TextEditingController extraDetails = TextEditingController();
  TextEditingController extraPrice = TextEditingController();
  List<({String details, int price})> sizesList = [];
  List<({String details, int price})> packagesList = [];
  List<({String details, int price})> cuttingList = [];
  List<({String details, int price})> headList = [];
  List<({String details, int price})> mafroumList = [];
  File? image;
  String? imageUrl;
  int productType = 0;

  AddProductBloc() : super(AddProductInitial()) {
    on<AddProductEvent>(
      (event, emit) async {
        switch (event) {
          case AddExtraSize():
            {
              if (extraDetails.text.isNotEmpty && extraPrice.text.isNotEmpty) {
                sizesList.add((
                  details: extraDetails.text,
                  price: int.parse(extraPrice.text),
                ));

                emit(AddProductInitial());
              }
            }
            break;
          case DeleteExtraSize():
            {
              sizesList.removeAt(event.index);
              emit(AddProductInitial());
            }
            break;
          case AddExtraPackage():
            {
              if (extraDetails.text.isNotEmpty && extraPrice.text.isNotEmpty) {
                packagesList.add((
                  details: extraDetails.text,
                  price: int.parse(extraPrice.text),
                ));
                emit(AddProductInitial());
              }
            }
            break;
          case DeleteExtraPackage():
            {
              packagesList.removeAt(event.index);
              emit(AddProductInitial());
            }
            break;
          case AddExtraCutting():
            {
              if (extraDetails.text.isNotEmpty && extraPrice.text.isNotEmpty) {
                cuttingList.add((
                  details: extraDetails.text,
                  price: int.parse(extraPrice.text),
                ));
                emit(AddProductInitial());
              }
            }
            break;
          case DeleteExtraCutting():
            {
              cuttingList.removeAt(event.index);
              emit(AddProductInitial());
            }
            break;
          case AddExtraHead():
            {
              if (extraDetails.text.isNotEmpty && extraPrice.text.isNotEmpty) {
                headList.add((
                  details: extraDetails.text,
                  price: int.parse(extraPrice.text),
                ));
                emit(AddProductInitial());
              }
            }
            break;
          case DeleteExtraHead():
            {
              headList.removeAt(event.index);
              emit(AddProductInitial());
            }
            break;
          case AddExtraMafroum():
            {
              if (extraDetails.text.isNotEmpty && extraPrice.text.isNotEmpty) {
                mafroumList.add((
                  details: extraDetails.text,
                  price: int.parse(extraPrice.text),
                ));
                emit(AddProductInitial());
              }
            }
            break;
          case DeleteExtraMafroum():
            {
              mafroumList.removeAt(event.index);
              emit(AddProductInitial());
            }
            break;
          case AddProduct():
            {
              if (productName.text.isNotEmpty &&
                  productPrice.text.isNotEmpty &&
                  image != null) {
                PopUpLoading.loading();
                try {
                  imageUrl = await addProductRebo.uploadImage(file: image!);
                  if (imageUrl != null) {
                    addProductRebo.addProduct(
                      productType: productType,
                      productName: productName.text,
                      productPrice: int.parse(productPrice.text),
                      productDetails: productDetails.text,
                      imageUrl: imageUrl!,
                      sizes: addProductRebo.convertRecordToMap(
                        recordList: sizesList,
                      ),
                      packages: addProductRebo.convertRecordToMap(
                        recordList: packagesList,
                      ),
                      cuttings: addProductRebo.convertRecordToMap(
                        recordList: cuttingList,
                      ),
                      head: addProductRebo.convertRecordToMap(
                        recordList: headList,
                      ),
                      mafroum: addProductRebo.convertRecordToMap(
                        recordList: mafroumList,
                      ),
                    );
                  }
                  PopUpLoading.success("تم اضافة المنتج بنجاح");
                } catch (e) {
                  PopUpLoading.error("حدث خطأ ما");
                }
                PopUpLoading.dismiss();
              } else {
                PopUpLoading.error(
                    "برجاء التأكد من كتابة اسم المنتج و السعر و اختيار الصوره");
              }
            }
            break;
          case PickImage():
            {
              image = await addProductRebo.pickImage();
            }
            break;
          case TypeSelect():
            {
              productType = event.newValue;
              emit(AddProductInitial());
            }
            break;
        }
      },
    );
  }
}
