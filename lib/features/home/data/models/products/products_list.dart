import 'package:bariy_alshamal/features/home/data/models/products/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsList {
  List<ProductModel> productsList;
  ProductsList({required this.productsList});
  factory ProductsList.fromList(
      {required List<QueryDocumentSnapshot<Map<String, dynamic>>> data}) {
    List<ProductModel> result = [];
    for (var element in data) {
      result.add(
        ProductModel.fromJson(
          data: element.data(),
        ),
      );
    }
    return ProductsList(productsList: result);
  }
}
