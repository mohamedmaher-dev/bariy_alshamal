import 'package:bariy_alshamal/features/one_product/data/rebos/one_product_rebo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OneProductRemoteRebo implements OneProductRebo {
  FirebaseFirestore store = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  addOrderToCart({
    required String productName,
    required int count,
    required int totalPrice,
    required String note,
    required String? size,
    required String? cut,
    required String? package,
    required String? mafroum,
    required String? head,
  }) async {
    await store
        .collection("carts")
        .doc(auth.currentUser!.uid)
        .collection("items")
        .add(
      {
        "product_name": productName,
        "count": count,
        "total_price": totalPrice,
        "note": note,
        "size": size,
        "cut": cut,
        "package": package,
        "mafroum": mafroum,
        "head": head,
      },
    );
  }
}
