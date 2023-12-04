import 'package:bariy_alshamal/features/admin/products/data/rebo/admin_products_rebo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminProductsRemoteRebo implements AdminProductsRebo {
  FirebaseFirestore store = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  @override
  Future changeActive(
      {required String prodctsID, required bool currentActive}) async {
    await store.collection("products").doc(prodctsID).update(
      {
        "isActive": !currentActive,
      },
    );
  }

  @override
  Future deleteProduct(
      {required String prodctsID, required String imageUrl}) async {
    await store.collection("products").doc(prodctsID).delete();
    await storage.refFromURL(imageUrl).delete();
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getProducts() async {
    return await store.collection("products").get().then(
      (value) {
        return value.docs;
      },
    );
  }
}
