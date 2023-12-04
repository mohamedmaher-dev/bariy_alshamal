import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userName;
  int userPhone;
  UserModel({
    required this.userName,
    required this.userPhone,
  });

  factory UserModel.fromJson(
      {required QueryDocumentSnapshot<Map<String, dynamic>> data}) {
    return UserModel(
      userName: data.data()["user_name"],
      userPhone: data.data()["user_phone"],
    );
  }
}
