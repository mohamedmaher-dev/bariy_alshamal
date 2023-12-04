class ExtraModel {
  String details;
  int price;
  ExtraModel({required this.details, required this.price});

  factory ExtraModel.fromJson({required Map data}) {
    return ExtraModel(details: data["details"], price: data["price"]);
  }
}
