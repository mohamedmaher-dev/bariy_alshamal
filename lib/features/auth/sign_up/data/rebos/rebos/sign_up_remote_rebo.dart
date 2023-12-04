import 'package:bariy_alshamal/core/utils/firestore_manger.dart';
import 'package:bariy_alshamal/core/utils/print.dart';
import 'package:bariy_alshamal/features/auth/sign_up/data/rebos/sign_up_rebo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpRemoteRebo implements SignUpRebo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<bool> isNewUser({required int phoneNumber}) async {
    List dataList = [];
    QuerySnapshot<Map<String, dynamic>> data = await firestore
        .collection(FireStoreCollection.users)
        .where(FireStoreFields.phone, isEqualTo: phoneNumber)
        .limit(1)
        .get();
    for (QueryDocumentSnapshot<Map<String, dynamic>> element in data.docs) {
      dataList.add(element.data());
    }
    DebugPrint.success(dataList.toString());
    if (dataList.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
