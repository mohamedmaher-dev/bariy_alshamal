import 'package:bariy_alshamal/features/admin/users/presntation/data/rebos/users_rebo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersRemoteRebo implements UsersRebo {
  FirebaseFirestore store = FirebaseFirestore.instance;
  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getUsers() async {
    return store.collection("users").get().then(
      (value) {
        return value.docs;
      },
    );
  }
}
