import 'package:bariy_alshamal/features/my_orders/data/models/my_order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyOrdersListModel {
  List<MyOrderModel> list;
  MyOrdersListModel({required this.list});
  factory MyOrdersListModel.fromList({
    required List<QueryDocumentSnapshot<Map<String, dynamic>>> data,
  }) {
    List<MyOrderModel> result = [];
    for (var element in data) {
      result.add(MyOrderModel.fromJson(data: element));
    }
    return MyOrdersListModel(list: result);
  }
}
