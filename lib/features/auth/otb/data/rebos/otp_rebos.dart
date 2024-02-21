import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

abstract class OtpRebos {
  Future<void> sendSms({required int userPhone, required BuildContext context});

  Future<UserCredential?> signIn({
    required String otp,
    required String verificationId,
  });

  Future<void> createNewUser({
    required String userUID,
    required int userPhone,
    required String userName,
    required int countryCode,
    required String city,
  });
}
