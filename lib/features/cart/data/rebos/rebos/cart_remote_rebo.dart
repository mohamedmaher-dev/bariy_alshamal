// ignore_for_file: depend_on_referenced_packages

import 'package:bariy_alshamal/features/cart/data/models/cart_item_list_model.dart';
import 'package:bariy_alshamal/features/cart/data/rebos/cart_rebo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:latlong2/latlong.dart';

class CartRemoteRebo implements CartRebo {
  FirebaseFirestore store = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
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
  }) async {
    await store.collection("orders").add(
      {
        "order_id": orderInfo.orderID,
        "order_price": orderInfo.orderprice,
        "discount": promoCode.discount,
        "user_uid": auth.currentUser!.uid,
        "user_name": auth.currentUser!.displayName,
        "user_phone": auth.currentUser!.phoneNumber,
        "user_city": userCity,
        "date": DateTime.now().toUtc(),
        "location": {"lat": location.latitude, "long": location.longitude},
        "bank_account_name": bank.accountName,
        "bank_account_num": bank.accountNum,
        "bank_name": bank.bankName,
        "screen_url": bank.screenUrl,
        "status": 1,
        "products_count": items.length,
        "products": items,
      },
    );

    await setPromoCodeNotActive(promoCode: promoCode.promoCodeID);
  }

  @override
  Future<void> setPromoCodeNotActive({required String? promoCode}) async {
    if (promoCode != null) {
      await store.collection("promo_codes").doc(promoCode).update(
        {"is_active": false},
      );
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

  @override
  Future<({String code, bool isActive, int value})?> getPromoCode({
    required String code,
  }) async {
    return await store.collection("promo_codes").doc(code).get().then(
      (value) {
        if (value.exists) {
          return (
            code: value.id,
            isActive: value.data()!["is_active"] as bool,
            value: value.data()!["value"] as int
          );
        } else {
          return null;
        }
      },
    );
  }

  @override
  List<Map> getProducts({required CartItemListModel cartItems}) {
    List<Map> result = [];
    for (var element in cartItems.list) {
      result.add(
        {
          "total_price": element.totalPrice,
          "count": element.count,
          "product_name": element.productName,
          "note": element.note,
          "size": element.size,
          "cut": element.cut,
          "package": element.package,
          "mafroum": element.mafroum,
          "head": element.head,
        },
      );
    }
    return result;
  }

  @override
  String createOrderID() {
    DateTime id = DateTime.now().toUtc();
    return "${id.year}${id.month}${id.day}${id.hour}${id.minute}${id.second}${id.microsecond}";
  }

  @override
  Future<String> getUserCity() async {
    return await store
        .collection("users")
        .doc(auth.currentUser!.uid)
        .get()
        .then(
      (value) {
        return value.data()!["city"];
      },
    );
  }

  // @override
  // Future<File?> pickImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   XFile? image = await picker.pickImage(
  //     source: ImageSource.gallery,
  //     imageQuality: 50,
  //   );
  //   if (image != null) {
  //     return File(image.path);
  //   } else {
  //     return null;
  //   }
  // }

  // @override
  // Future<String> uploadImage({required File file}) async {
  //   String name = basename(file.path);
  //   Reference ref = storage.ref("bank/$name");
  //   await ref.putFile(file);
  //   String url = await ref.getDownloadURL();
  //   return url;
  // }
}
