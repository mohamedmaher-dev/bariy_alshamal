class ProductExtraModel {
  List<({String details, int price})> list;
  ProductExtraModel({required this.list});
  factory ProductExtraModel.fromList({
    required List data,
  }) {
    List<({String details, int price})> result = [];
    for (var element in data) {
      result.add((details: element["details"], price: element["price"]));
    }
    return ProductExtraModel(list: result);
  }
}
