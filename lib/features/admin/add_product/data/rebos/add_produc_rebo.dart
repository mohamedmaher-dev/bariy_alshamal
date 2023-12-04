import 'dart:io';

abstract class AddProductRebo {
  addProduct({
    required int productType,
    required String productName,
    required int productPrice,
    required String productDetails,
    required String imageUrl,
    required List<Map> sizes,
    required List<Map> packages,
    required List<Map> cuttings,
    required List<Map> head,
    required List<Map> mafroum,
  });

  List<Map> convertRecordToMap({
    required List<
            ({
              String details,
              int price,
            })>
        recordList,
  });

  Future<File?> pickImage();

  Future<String> uploadImage({required File file});
}
