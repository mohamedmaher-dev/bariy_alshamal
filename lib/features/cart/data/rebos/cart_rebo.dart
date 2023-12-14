import 'package:bariy_alshamal/features/cart/data/models/cart_item_list_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';

abstract class CartRebo {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getCartItems();

  Future deleteCartItem({required String cartItemID});

  Future addOrder({
    required ({String orderID, int orderprice}) orderInfo,
    required ({String? promoCodeID, int discount}) promoCode,
    required ({
      String accountName,
      String accountNum,
      String bankName,
      String screenUrl
    }) bank,
    required String userCity,
    required LatLng location,
    required List<Map> items,
  });

  Future setPromoCodeNotActive({required String? promoCode});

  Future deleteCart({
    required CartItemListModel cartItems,
  });

  Future<({String code, bool isActive, int value})?> getPromoCode({
    required String code,
  });

  List<Map> getProducts({required CartItemListModel cartItems});
  String createOrderID();

  Future<String> getUserCity();

  // Future<File?> pickImage();

  // Future<String> uploadImage({required File file});
}
