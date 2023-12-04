import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AdminProductsRebo {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getProducts();
  Future changeActive({required String prodctsID, required bool currentActive});
  Future deleteProduct({required String prodctsID, required String imageUrl});
}
