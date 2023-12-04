import 'package:cloud_firestore/cloud_firestore.dart';

class AdminProductModel {
  String productName;
  String imageUrl;
  bool isActive;
  String productId;
  AdminProductModel({
    required this.imageUrl,
    required this.isActive,
    required this.productId,
    required this.productName,
  });

  factory AdminProductModel.fromJson(
      {required QueryDocumentSnapshot<Map<String, dynamic>> data}) {
    return AdminProductModel(
      imageUrl: data.data()["image_url"],
      isActive: data.data()["isActive"],
      productId: data.id,
      productName: data.data()["product_name"],
    );
  }
}
