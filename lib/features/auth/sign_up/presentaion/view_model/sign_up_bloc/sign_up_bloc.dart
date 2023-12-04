// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, unnecessary_import

import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/core/utils/popup_loading_manger.dart';
import 'package:bariy_alshamal/core/utils/print.dart';
import 'package:bariy_alshamal/features/auth/otb/presntation/view_model/otp_bloc/otp_bloc.dart';
import 'package:bariy_alshamal/features/auth/sign_up/data/rebos/rebos/sign_up_remote_rebo.dart';
import 'package:bariy_alshamal/features/auth/sign_up/data/rebos/sign_up_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpRebo signUpRebo = SignUpRemoteRebo();
  GlobalKey<FormState> formKey = GlobalKey();
  late bool isNewUser;
  late String userUID;
  TextEditingController userName = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>(
      (event, emit) async {
        switch (event) {
          case (CreateAccountClick()):
            {
              if (formKey.currentState!.validate()) {
                PopUpLoading.loading();
                try {
                  isNewUser = await signUpRebo.isNewUser(
                    phoneNumber: int.parse(userPhone.text),
                  );
                  if (isNewUser) {
                    try {
                      BlocProvider.of<OtpBloc>(event.context).userPhone =
                          int.parse(userPhone.text);
                      BlocProvider.of<OtpBloc>(event.context).userName =
                          userName.text;
                      BlocProvider.of<OtpBloc>(event.context).isNewUser =
                          isNewUser;
                      AppRoute.push(context: event.context, page: Pages.otp);
                    } catch (e) {
                      PopUpLoading.error("حدث خطأ ما");
                      DebugPrint.error(e.toString());
                    }
                  } else {
                    PopUpLoading.error(
                      "هذا رقم تم استخدامة من قبل برجاء تسجيل الدخول",
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
          case (AreadyHaveAccountClick()):
            {
              AppRoute.pushReplacement(
                context: event.context,
                page: Pages.signIn,
              );
            }
            break;
        }
      },
    );
  }
}
