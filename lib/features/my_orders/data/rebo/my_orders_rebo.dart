import 'package:cloud_firestore/cloud_firestore.dart';

abstract class MyOrdersRebo {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getMyOrders();
}
