import 'package:bariy_alshamal/features/splash/rebos/splash_rebo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SplashRemoteRebo implements SplashRebo {
  FirebaseFirestore store = FirebaseFirestore.instance;
  @override
  Future getUserData({required String userUID}) async {
    return await store.collection("users").doc(userUID).get().then(
      (value) {
        return value;
      },
    );
  }
}
