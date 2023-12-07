import 'package:bariy_alshamal/features/my_orders/data/rebo/my_orders_rebo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyOrdersRemoteRebo implements MyOrdersRebo {
  FirebaseFirestore store = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getMyOrders() async {
    return store
        .collection("orders")
        .where("user_uid", isEqualTo: auth.currentUser!.uid)
        .get()
        .then(
      (value) {
        return value.docs;
      },
    );
  }
}
