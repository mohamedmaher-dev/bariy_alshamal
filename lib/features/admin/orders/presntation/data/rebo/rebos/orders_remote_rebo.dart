import 'package:bariy_alshamal/features/admin/orders/presntation/data/rebo/orders_rebo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersRemoteRebo implements OrderRebo {
  FirebaseFirestore store = FirebaseFirestore.instance;
  @override
  Future deleteOrder({required String orderID}) async {
    await store.collection("orders").doc(orderID).delete();
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getOrders() async {
    return await store.collection("orders").get().then((value) {
      return value.docs;
    });
  }

  @override
  Future<void> changeStatus(
      {required int newStatus, required String orderDocID}) async {
    await store.collection("orders").doc(orderDocID).update(
      {"status": newStatus},
    );
  }
}
