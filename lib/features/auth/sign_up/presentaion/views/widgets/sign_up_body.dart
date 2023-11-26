import 'package:bariy_alshamal/features/auth/sign_up/presentaion/views/widgets/sign_up_buttons_body.dart';
import 'package:bariy_alshamal/features/auth/sign_up/presentaion/views/widgets/sign_up_text_fields_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10).h,
      child: ListView(
        padding: const EdgeInsets.all(10).h,
        shrinkWrap: true,
        children: [
          const SignUpTextFieldsBody(),
          SizedBox(height: 10.h),
          const SignUpButtonsBody(),
        ],
      ),
    );
  }
}
