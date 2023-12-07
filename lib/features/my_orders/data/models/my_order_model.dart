import 'package:cloud_firestore/cloud_firestore.dart';

class MyOrderModel {
  String productName;
  int count;
  int price;
  MyOrderModel({
    required this.productName,
    required this.count,
    required this.price,
  });
  factory MyOrderModel.fromJson({
    required QueryDocumentSnapshot<Map<String, dynamic>> data,
  }) {
    return MyOrderModel(
      productName: data.data()["product_name"],
      count: data.data()["product_count"],
      price: data.data()["total_price"],
    );
  }
}
