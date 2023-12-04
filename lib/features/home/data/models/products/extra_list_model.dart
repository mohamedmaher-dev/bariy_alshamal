import 'package:bariy_alshamal/features/home/data/models/products/extra_model.dart';

class ExtraList {
  List<ExtraModel> list;
  ExtraList({required this.list});
  factory ExtraList.fromList({required List data}) {
    List<ExtraModel> result = [];
    for (var element in data) {
      result.add(ExtraModel.fromJson(data: element));
    }
    return ExtraList(list: result);
  }
}
