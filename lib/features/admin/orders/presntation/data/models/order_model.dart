import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String orderID;
  String productName;
  int price;
  int count;
  DateTime date;
  ({double lat, double long}) location;
  String? size;
  String? head;
  String? package;
  String? mafroum;
  String? cut;
  String? note;
  String userName;
  String userPhone;
  OrderModel({
    required this.orderID,
    required this.productName,
    required this.price,
    required this.count,
    required this.date,
    required this.location,
    required this.size,
    required this.head,
    required this.package,
    required this.mafroum,
    required this.cut,
    required this.note,
    required this.userName,
    required this.userPhone,
  });
  factory OrderModel.fromJson(
      {required QueryDocumentSnapshot<Map<String, dynamic>> data}) {
    return OrderModel(
      orderID: data.id,
      productName: data.data()["product_name"],
      price: data.data()["total_price"],
      count: data.data()["product_count"],
      date: data.data()["date"].toDate(),
      location: (
        lat: data.data()["location"]["lat"],
        long: data.data()["location"]["long"]
      ),
      size: data.data()["size"],
      head: data.data()["head"],
      package: data.data()["package"],
      mafroum: data.data()["mafroum"],
      cut: data.data()["cut"],
      note: data.data()["note"],
      userName: data.data()["user_name"],
      userPhone: data.data()["user_phone"],
    );
  }
}
