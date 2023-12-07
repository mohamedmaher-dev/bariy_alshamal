// ignore_for_file: depend_on_referenced_packages, unnecessary_import, use_build_context_synchronously

import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/core/utils/popup_loading_manger.dart';
import 'package:bariy_alshamal/core/utils/print.dart';
import 'package:bariy_alshamal/features/auth/otb/data/rebos/otp_rebos.dart';
import 'package:bariy_alshamal/features/auth/otb/data/rebos/rebos/otp_remote_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpRebos otpRebos = OtpRemoteRebo();
  FirebaseAuth auth = FirebaseAuth.instance;
  late bool isNewUser;
  late String userName;
  late int userPhone;
  late String city;
  String? verificationId;
  UserCredential? userData;
  int timeLeft = 60;
  OtpBloc() : super(OtpInitial()) {
    on<OtpEvent>(
      (event, emit) async {
        switch (event) {
          case (OtpInitEvent()):
            {
              timeLeft = 60;
              otpRebos.sendSms(userPhone: userPhone, context: event.context);
            }
            break;
          case (PhoneIncorrectClick()):
            {
              AppRoute.pushReplacement(
                context: event.context,
                page: Pages.signIn,
              );
            }
            break;
          case OtpComplete():
            {
              if (verificationId != null) {
                PopUpLoading.loading();
                try {
                  userData = await otpRebos.signIn(
                    otp: event.otpCode,
                    verificationId: verificationId!,
                  );

                  if (userData != null) {
                    if (isNewUser) {
                      await otpRebos.createNewUser(
                        userUID: userData!.user!.uid,
                        userPhone: userPhone,
                        userName: userName,
                        countryCode: 966,
                        city: city,
                      );
                      auth.currentUser!.updateDisplayName(userName);
                    }
                    AppRoute.pushAndRemoveUntil(
                      context: event.context,
                      page: Pages.splash,
                    );
                  }
                } on FirebaseAuthException catch (e) {
                  PopUpLoading.error(e.message.toString());
                } catch (e) {
                  DebugPrint.error(e.toString());
                  PopUpLoading.error("حدث خطأ ما");
                }
                PopUpLoading.dismiss();
              }
            }
            break;
        }
      },
    );
  }
}
