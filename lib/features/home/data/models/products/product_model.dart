import 'package:bariy_alshamal/features/home/data/models/products/extra_list_model.dart';

class ProductModel {
  int productType;
  String productName;
  int productPrice;
  String productDetails;
  String imageUrl;
  bool isActive;
  ExtraList sizes;
  ExtraList packages;
  ExtraList cutting;
  ExtraList head;
  ExtraList mafroum;
  ProductModel(
      {required this.productType,
      required this.productName,
      required this.productPrice,
      required this.productDetails,
      required this.imageUrl,
      required this.isActive,
      required this.sizes,
      required this.packages,
      required this.cutting,
      required this.head,
      required this.mafroum});

  factory ProductModel.fromJson({required Map data}) {
    return ProductModel(
      productType: data["product_type"],
      productName: data["product_name"],
      productPrice: data["product_price"],
      productDetails: data["product_details"],
      imageUrl: data["image_url"],
      isActive: data["isActive"],
      sizes: ExtraList.fromList(data: data["sizes"]),
      packages: ExtraList.fromList(data: data["packages"]),
      cutting: ExtraList.fromList(data: data["cuttings"]),
      head: ExtraList.fromList(data: data["head"]),
      mafroum: ExtraList.fromList(data: data["mafroum"]),
    );
  }
}
