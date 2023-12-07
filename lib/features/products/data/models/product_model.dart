import 'package:bariy_alshamal/features/products/data/models/product_extra_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  int productType;
  String productName;
  int productPrice;
  String productDetails;
  String imageUrl;
  bool isActive;
  ProductExtraModel size;
  ProductExtraModel package;
  ProductExtraModel cut;
  ProductExtraModel head;
  ProductExtraModel mafroum;
  ProductModel({
    required this.productType,
    required this.productName,
    required this.productPrice,
    required this.productDetails,
    required this.imageUrl,
    required this.isActive,
    required this.size,
    required this.package,
    required this.cut,
    required this.head,
    required this.mafroum,
  });

  factory ProductModel.fromJson({
    required QueryDocumentSnapshot<Map<String, dynamic>> data,
  }) {
    return ProductModel(
      productType: data.data()["product_type"],
      productName: data.data()["product_name"],
      productPrice: data.data()["product_price"],
      productDetails: data.data()["product_details"],
      imageUrl: data.data()["image_url"],
      isActive: data.data()["isActive"],
      size: ProductExtraModel.fromList(data: data.data()["sizes"]),
      package: ProductExtraModel.fromList(data: data.data()["packages"]),
      cut: ProductExtraModel.fromList(data: data.data()["cuttings"]),
      head: ProductExtraModel.fromList(data: data.data()["head"]),
      mafroum: ProductExtraModel.fromList(data: data.data()["mafroum"]),
    );
  }
}
