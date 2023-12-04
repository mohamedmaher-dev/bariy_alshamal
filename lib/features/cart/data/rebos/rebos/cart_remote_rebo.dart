import 'package:bariy_alshamal/features/cart/data/models/cart_item_list_model.dart';
import 'package:bariy_alshamal/features/cart/data/rebos/cart_rebo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:latlong2/latlong.dart';

class CartRemoteRebo implements CartRebo {
  FirebaseFirestore store = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCartItems() async {
    return await store
        .collection("carts")
        .doc(auth.currentUser!.uid)
        .collection("items")
        .get()
        .then((value) {
      return value.docs;
    });
  }

  @override
  Future deleteCartItem({required String cartItemID}) async {
    await store
        .collection("carts")
        .doc(auth.currentUser!.uid)
        .collection("items")
        .doc(cartItemID)
        .delete();
  }

  @override
  Future addOrder({
    required CartItemListModel cartItems,
    required LatLng location,
  }) async {
    for (var element in cartItems.list) {
      await store.collection("orders").add({
        "user_uid": auth.currentUser!.uid,
        "user_name": auth.currentUser!.displayName,
        "user_phone": auth.currentUser!.phoneNumber,
        "date": DateTime.now().toUtc(),
        "product_name": element.productName,
        "product_count": element.count,
        "total_price": element.totalPrice,
        "note": element.note,
        "location": {"lat": location.latitude, "long": location.longitude},
        "size": element.size,
        "cut": element.cut,
        "package": element.package,
        "mafroum": element.mafroum,
        "head": element.head,
      });
    }
  }

  @override
  Future deleteCart({
    required CartItemListModel cartItems,
  }) async {
    for (var element in cartItems.list) {
      await store
          .collection("carts")
          .doc(auth.currentUser!.uid)
          .collection("items")
          .doc(element.cartItemID)
          .delete();
    }
  }
}
