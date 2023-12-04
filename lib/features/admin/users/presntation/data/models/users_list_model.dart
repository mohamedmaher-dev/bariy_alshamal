import 'package:bariy_alshamal/features/admin/users/presntation/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersListModel {
  List<UserModel> list;
  UsersListModel({required this.list});
  factory UsersListModel.fromList({
    required List<QueryDocumentSnapshot<Map<String, dynamic>>> data,
  }) {
    List<UserModel> result = [];
    for (var element in data) {
      result.add(UserModel.fromJson(data: element));
    }
    return UsersListModel(list: result);
  }
}
