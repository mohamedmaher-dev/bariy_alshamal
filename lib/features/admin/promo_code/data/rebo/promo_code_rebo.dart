import 'package:cloud_firestore/cloud_firestore.dart';

abstract class PromoCodeRebo {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getPromoCodes();
  Future addPromoCode({required String code, required int value});
  String codeGenerator({required int length});
  Future deletePromoCode({required String code});
}
