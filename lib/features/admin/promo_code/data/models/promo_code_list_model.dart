import 'package:bariy_alshamal/features/admin/promo_code/data/models/promo_code_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PromoCodeListModel {
  List<PromoCodeModel> list;
  PromoCodeListModel({required this.list});
  factory PromoCodeListModel.fromList({
    required List<QueryDocumentSnapshot<Map<String, dynamic>>> data,
  }) {
    List<PromoCodeModel> result = [];
    for (var element in data) {
      result.add(
        PromoCodeModel.fromJson(data: element),
      );
    }
    return PromoCodeListModel(list: result);
  }
}
