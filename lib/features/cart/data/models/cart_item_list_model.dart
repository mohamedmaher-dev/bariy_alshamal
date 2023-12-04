import 'package:bariy_alshamal/features/cart/data/models/cart_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemListModel {
  List<CartItemModel> list;
  CartItemListModel({required this.list});
  factory CartItemListModel.fromList(
      {required List<QueryDocumentSnapshot<Map<String, dynamic>>> data}) {
    List<CartItemModel> result = [];
    for (var element in data) {
      result.add(
        CartItemModel.fromJson(data: element),
      );
    }
    return CartItemListModel(list: result);
  }
}
