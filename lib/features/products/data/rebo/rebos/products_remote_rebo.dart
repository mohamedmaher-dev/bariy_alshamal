import 'package:bariy_alshamal/features/products/data/rebo/products_rebo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsRemoteRebo implements ProductsRebo {
  FirebaseFirestore store = FirebaseFirestore.instance;
  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getProducts({
    required int productType,
  }) {
    return store
        .collection("products")
        .where("product_type", isEqualTo: productType)
        .get()
        .then(
      (value) {
        return value.docs;
      },
    );
  }
}
