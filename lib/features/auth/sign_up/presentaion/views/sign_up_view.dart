import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/widgets/app_icon.dart';
import 'package:bariy_alshamal/features/auth/sign_up/presentaion/views/widgets/sign_up_body.dart';
import 'package:bariy_alshamal/features/auth/sign_up/presentaion/views/widgets/sign_up_msg_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsManger.green,
      body: SafeArea(
        child: Stack(
          children: [
            // GradientBack(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(),
                SignUpMsgBody(),
                Spacer(),
                AppIcon(),
                Spacer(),
                SignUpBody(),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
