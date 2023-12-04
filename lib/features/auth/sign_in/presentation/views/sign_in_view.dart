import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/features/auth/sign_in/presentation/view_model/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/app_icon.dart';
import 'widgets/sign_in_body.dart';
import 'widgets/sign_in_msg.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    SignInBloc controller = BlocProvider.of<SignInBloc>(context);
    return Scaffold(
      appBar: const AppBarView(title: null),
      backgroundColor: ColorsManger.green,
      body: SafeArea(
        child: Stack(
          children: [
            // GradientBack(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const SignInMsg(),
                const Spacer(),
                const AppIcon(),
                const Spacer(),
                SignInBody(controller: controller),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
