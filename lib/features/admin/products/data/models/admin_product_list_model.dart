import 'package:bariy_alshamal/features/admin/products/data/models/admin_poduct_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminProductListModel {
  List<AdminProductModel> list;
  AdminProductListModel({required this.list});
  factory AdminProductListModel.fromList({
    required List<QueryDocumentSnapshot<Map<String, dynamic>>> data,
  }) {
    List<AdminProductModel> result = [];
    for (var element in data) {
      result.add(
        AdminProductModel.fromJson(
          data: element,
        ),
      );
    }
    return AdminProductListModel(list: result);
  }
}
