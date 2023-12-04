import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  String? cartItemID;
  String productName;
  int count;
  int totalPrice;
  String note;
  String? size;
  String? cut;
  String? package;
  String? mafroum;
  String? head;
  CartItemModel({
    required this.cartItemID,
    required this.productName,
    required this.count,
    required this.totalPrice,
    required this.note,
    required this.size,
    required this.cut,
    required this.package,
    required this.mafroum,
    required this.head,
  });

  factory CartItemModel.fromJson(
      {required QueryDocumentSnapshot<Map<String, dynamic>> data}) {
    return CartItemModel(
      cartItemID: data.id,
      productName: data.data()["product_name"],
      count: data.data()["count"],
      totalPrice: data.data()["total_price"],
      note: data.data()["note"],
      size: data.data()["size"],
      cut: data.data()["cut"],
      package: data.data()["package"],
      mafroum: data.data()["mafroum"],
      head: data.data()["head"],
    );
  }
}
