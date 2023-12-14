import 'package:cloud_firestore/cloud_firestore.dart';

abstract class OrderRebo {
  Future deleteOrder({required String orderID});
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getOrders();
  Future<void> changeStatus(
      {required int newStatus, required String orderDocID});
}
