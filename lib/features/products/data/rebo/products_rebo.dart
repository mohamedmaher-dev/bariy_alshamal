import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProductsRebo {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getProducts(
      {required int productType});
}
