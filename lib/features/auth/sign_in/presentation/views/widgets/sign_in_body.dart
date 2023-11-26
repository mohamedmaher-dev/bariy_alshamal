import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sign_in_buttons_body.dart';
import 'sign_in_text_fields_body.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10).h,
      child: ListView(
        padding: const EdgeInsets.all(10).h,
        shrinkWrap: true,
        children: [
          const SignInTextFieldsBody(),
          SizedBox(height: 10.h),
          const SignInButtonsBody(),
        ],
      ),
    );
  }
}
