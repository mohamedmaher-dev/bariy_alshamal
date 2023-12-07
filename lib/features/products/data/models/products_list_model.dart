import 'package:bariy_alshamal/features/products/data/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsListModel {
  List<ProductModel> list;
  ProductsListModel({required this.list});
  factory ProductsListModel.fromList({
    required List<QueryDocumentSnapshot<Map<String, dynamic>>> data,
  }) {
    List<ProductModel> result = [];
    for (var element in data) {
      result.add(ProductModel.fromJson(data: element));
    }
    return ProductsListModel(list: result);
  }
}
