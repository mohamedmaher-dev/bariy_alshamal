import 'package:cloud_firestore/cloud_firestore.dart';

class MyOrderModel {
  String orderID;
  int productsCount;
  int orderPrice;
  int status;
  int discount;
  DateTime date;
  MyOrderModel({
    required this.orderID,
    required this.productsCount,
    required this.orderPrice,
    required this.status,
    required this.discount,
    required this.date,
  });
  factory MyOrderModel.fromJson({
    required QueryDocumentSnapshot<Map<String, dynamic>> data,
  }) {
    return MyOrderModel(
      orderID: data.data()["order_id"],
      productsCount: data.data()["products_count"],
      orderPrice: data.data()["order_price"],
      status: data.data()["status"],
      date: data.data()["date"].toDate(),
      discount: data.data()["discount"],
    );
  }
}
