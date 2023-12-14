// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String orderDocID;
  String bankAccountName;
  String bankAccountNum;
  String bankName;
  DateTime date;
  int discount;
  ({double lat, double long}) location;
  String orderID;
  int orderPrice;
  List<_ProductModel> products;
  int productsCount;
  String screenUrl;
  int status;
  String userCity;
  String userName;
  String userPhone;
  String userUid;

  OrderModel({
    required this.orderDocID,
    required this.bankAccountName,
    required this.bankAccountNum,
    required this.bankName,
    required this.date,
    required this.discount,
    required this.location,
    required this.orderID,
    required this.orderPrice,
    required this.products,
    required this.productsCount,
    required this.screenUrl,
    required this.status,
    required this.userCity,
    required this.userName,
    required this.userPhone,
    required this.userUid,
  });
  factory OrderModel.fromJson(
      {required QueryDocumentSnapshot<Map<String, dynamic>> data}) {
    return OrderModel(
      orderDocID: data.id,
      bankAccountName: data.data()["bank_account_name"],
      bankAccountNum: data.data()["bank_account_num"],
      bankName: data.data()["bank_name"],
      date: data.data()["date"].toDate(),
      discount: data.data()["discount"],
      location: (
        lat: data.data()["location"]["lat"],
        long: data.data()["location"]["long"]
      ),
      orderID: data.data()["order_id"],
      orderPrice: data.data()["order_price"],
      productsCount: data.data()["products_count"],
      screenUrl: data.data()["screen_url"],
      status: data.data()["status"],
      userCity: data.data()["user_city"],
      userName: data.data()["user_name"],
      userPhone: data.data()["user_phone"],
      userUid: data.data()["user_uid"],
      products: _products(data: data.data()["products"]),
    );
  }
}

class _ProductModel {
  int count;
  String? cut;
  String? head;
  String? mafroum;
  String? note;
  String? package;
  String productName;
  String? size;
  int totalPrice;

  _ProductModel({
    required this.count,
    required this.cut,
    required this.head,
    required this.mafroum,
    required this.note,
    required this.package,
    required this.productName,
    required this.size,
    required this.totalPrice,
  });

  factory _ProductModel.fromJson({required Map data}) {
    return _ProductModel(
      count: data["count"],
      cut: data["cut"],
      head: data["head"],
      mafroum: data["mafroum"],
      note: data["note"],
      package: data["package"],
      productName: data["product_name"],
      size: data["size"],
      totalPrice: data["total_price"],
    );
  }
}

List<_ProductModel> _products({required List data}) {
  List<_ProductModel> result = [];
  for (var element in data) {
    result.add(_ProductModel.fromJson(data: element));
  }
  return result;
}
