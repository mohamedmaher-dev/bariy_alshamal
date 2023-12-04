import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeRebo {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getProducts();
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getMilkProducts();
}
