import 'package:bariy_alshamal/features/auth/sign_in/presentation/view_model/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sign_in_buttons_body.dart';
import 'sign_in_text_fields_body.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key, required this.controller});
  final SignInBloc controller;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10).h,
      child: ListView(
        padding: const EdgeInsets.all(10).h,
        shrinkWrap: true,
        children: [
          SignInTextFieldsBody(controller: controller),
          SizedBox(height: 10.h),
          SignInButtonsBody(controller: controller),
        ],
      ),
    );
  }
}
