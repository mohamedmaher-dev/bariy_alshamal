import 'package:bariy_alshamal/features/home/data/rebos/home_rebo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRemoteRebo implements HomeRebo {
  FirebaseFirestore store = FirebaseFirestore.instance;
  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getProducts() async {
    return await store
        .collection("products")
        .where("product_type", isEqualTo: 0)
        .get()
        .then(
      (value) {
        return value.docs;
      },
    );
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getMilkProducts() async {
    return await store
        .collection("products")
        .where("product_type", isEqualTo: 1)
        .get()
        .then(
      (value) {
        return value.docs;
      },
    );
  }
}
