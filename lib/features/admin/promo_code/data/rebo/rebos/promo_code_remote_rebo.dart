import 'dart:math';

import 'package:bariy_alshamal/features/admin/promo_code/data/rebo/promo_code_rebo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PromoCodeRemoteRebo implements PromoCodeRebo {
  FirebaseFirestore store = FirebaseFirestore.instance;
  @override
  Future addPromoCode({required String code, required int value}) async {
    await store.collection("promo_codes").doc(code).set({
      "code": code,
      "value": value,
      "is_active": true,
    });
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getPromoCodes() async {
    return await store.collection("promo_codes").get().then((value) {
      return value.docs;
    });
  }

  @override
  String codeGenerator({required int length}) {
    String result = '';
    for (int i = 0; i < length; i++) {
      int charIndex = Random().nextInt(26);
      bool isChar = Random().nextBool();
      if (isChar) {
        bool isUpperCase = Random().nextBool();
        if (isUpperCase) {
          result =
              "$result${String.fromCharCode('A'.codeUnitAt(0) + charIndex)}";
        } else {
          result =
              "$result${String.fromCharCode('a'.codeUnitAt(0) + charIndex)}";
        }
      } else {
        result = "$result${Random().nextInt(10)}";
      }
    }
    return result;
  }

  @override
  Future deletePromoCode({required String code}) async {
    await store.collection("promo_codes").doc(code).delete();
  }
}
