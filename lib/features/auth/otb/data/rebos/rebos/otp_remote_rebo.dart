import 'package:bariy_alshamal/core/utils/print.dart';
import 'package:bariy_alshamal/features/auth/otb/data/rebos/otp_rebos.dart';
import 'package:bariy_alshamal/features/auth/otb/presntation/view_model/otp_bloc/otp_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/firestore_manger.dart';

class OtpRemoteRebo implements OtpRebos {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore store = FirebaseFirestore.instance;
  @override
  sendSms({required int userPhone, required BuildContext context}) {
    auth.verifyPhoneNumber(
      phoneNumber: "+966$userPhone",
      codeSent: (verificationId, forceResendingToken) {
        BlocProvider.of<OtpBloc>(context).verificationId = verificationId;
      },
      timeout: const Duration(seconds: 60),
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {
        DebugPrint.error(error.toString());
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  @override
  Future<UserCredential?> signIn({
    required String otp,
    required String verificationId,
  }) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    return await auth.signInWithCredential(credential).then(
      (value) {
        return value;
      },
    );
  }

  @override
  createNewUser({
    required String userUID,
    required int userPhone,
    required String userName,
    required int countryCode,
    required String city,
  }) {
    store.collection(FireStoreCollection.users).doc(userUID).set({
      FireStoreFields.name: userName,
      FireStoreFields.phone: userPhone,
      FireStoreFields.countryCode: countryCode,
      "city": city,
    });
  }
}
