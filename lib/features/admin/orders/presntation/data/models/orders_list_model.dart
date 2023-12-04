import 'package:bariy_alshamal/features/admin/orders/presntation/data/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersListModel {
  List<OrderModel> list;
  OrdersListModel({required this.list});

  factory OrdersListModel.fromList(
      {required List<QueryDocumentSnapshot<Map<String, dynamic>>> data}) {
    List<OrderModel> result = [];
    for (var element in data) {
      result.add(OrderModel.fromJson(data: element));
    }
    return OrdersListModel(list: result);
  }
}
