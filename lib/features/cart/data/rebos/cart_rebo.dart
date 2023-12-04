import 'package:bariy_alshamal/features/cart/data/models/cart_item_list_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';

abstract class CartRebo {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getCartItems();

  Future deleteCartItem({required String cartItemID});

  Future addOrder(
      {required CartItemListModel cartItems, required LatLng location});

  Future deleteCart({
    required CartItemListModel cartItems,
  });
}
