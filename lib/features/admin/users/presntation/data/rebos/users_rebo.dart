import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UsersRebo {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getUsers();
}
