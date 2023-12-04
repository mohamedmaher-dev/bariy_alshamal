// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:path/path.dart';
import 'package:bariy_alshamal/core/utils/firestore_manger.dart';
import 'package:bariy_alshamal/features/admin/add_product/data/rebos/add_produc_rebo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AddProductRemoteRebo implements AddProductRebo {
  FirebaseFirestore store = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  @override
  addProduct({
    required int productType,
    required String productName,
    required int productPrice,
    required String productDetails,
    required String imageUrl,
    required List<Map> sizes,
    required List<Map> packages,
    required List<Map> cuttings,
    required List<Map> head,
    required List<Map> mafroum,
  }) {
    store.collection(FireStoreCollection.products).doc().set({
      "product_type": productType,
      "product_name": productName,
      "product_price": productPrice,
      "product_details": productDetails,
      "isActive": true,
      "image_url": imageUrl,
      "sizes": sizes,
      "packages": packages,
      "cuttings": cuttings,
      "head": head,
      "mafroum": mafroum,
    });
  }

  @override
  List<Map> convertRecordToMap({
    required List<({String details, int price})> recordList,
  }) {
    List<Map> result = [];
    for (var element in recordList) {
      result.add({"details": element.details, "price": element.price});
    }
    return result;
  }

  @override
  Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }

  @override
  Future<String> uploadImage({required File file}) async {
    String name = basename(file.path);
    Reference ref = storage.ref(name);
    await ref.putFile(file);
    String url = await ref.getDownloadURL();
    return url;
  }
}
