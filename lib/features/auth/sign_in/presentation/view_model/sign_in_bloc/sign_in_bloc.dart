// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, unnecessary_import

import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/features/auth/sign_in/data/rebos/rebos/sign_in_remote_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/utils/popup_loading_manger.dart';
import '../../../../../../core/utils/print.dart';
import '../../../../otb/presntation/view_model/otp_bloc/otp_bloc.dart';
import '../../../data/rebos/sign_in_rebo.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInRebo signInRebo = SignInRemoteRebo();
  GlobalKey<FormState> formKey = GlobalKey();
  late bool isNewUser;
  late String userUID;
  TextEditingController userPhone = TextEditingController();
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) async {
      switch (event) {
        case (SignInClick()):
          {
            if (formKey.currentState!.validate()) {
              PopUpLoading.loading();
              try {
                isNewUser = await signInRebo.isNewUser(
                  phoneNumber: int.parse(userPhone.text),
                );
                if (!isNewUser) {
                  BlocProvider.of<OtpBloc>(event.context).userPhone =
                      int.parse(userPhone.text);
                  BlocProvider.of<OtpBloc>(event.context).isNewUser = isNewUser;
                  AppRoute.push(context: event.context, page: Pages.otp);
                } else {
                  PopUpLoading.error(
                    "هذا الرقم غير موجود برجاء انشاء حساب",
                  );
                }
              } catch (e) {
                PopUpLoading.error("حدث خطأ ما");
                DebugPrint.error(e.toString());
              }
              PopUpLoading.dismiss();
            }
          }
          break;
        case (CreateAccountClick()):
          {
            AppRoute.pushReplacement(
              context: event.context,
              page: Pages.signUp,
            );
          }
          break;
      }
    });
  }
}
