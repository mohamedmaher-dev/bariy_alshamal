import 'package:cloud_firestore/cloud_firestore.dart';

class PromoCodeModel {
  String code;
  bool isAvtive;
  int value;
  PromoCodeModel({
    required this.code,
    required this.isAvtive,
    required this.value,
  });
  factory PromoCodeModel.fromJson({
    required QueryDocumentSnapshot<Map<String, dynamic>> data,
  }) {
    return PromoCodeModel(
        code: data.id,
        isAvtive: data.data()["is_active"],
        value: data.data()["value"]);
  }
}
