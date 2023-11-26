import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/app_icon.dart';
import 'widgets/sign_in_body.dart';
import 'widgets/sign_in_msg.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
                SignInMsg(),
                Spacer(),
                AppIcon(),
                Spacer(),
                SignInBody(),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
