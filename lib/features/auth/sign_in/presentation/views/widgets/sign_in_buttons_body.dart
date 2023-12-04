import 'package:bariy_alshamal/features/auth/sign_in/presentation/view_model/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/localization/generated/l10n.dart';
import '../../../../../../core/themes/button_styles.dart';
import '../../../../../../core/themes/text_styles.dart';

class SignInButtonsBody extends StatelessWidget {
  const SignInButtonsBody({super.key, required this.controller});
  final SignInBloc controller;

  @override
  Widget build(BuildContext context) {
    Language language = Language.of(context);

    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            controller.add(SignInClick(context: context));
          },
          style: ButtonStyles.bsP,
          child: Text(language.sign_in, style: TextStyles.tsW15B),
        ),
        SizedBox(height: 10.h),
        ElevatedButton(
          onPressed: () {
            controller.add(CreateAccountClick(context: context));
          },
          style: ButtonStyles.bsT,
          child: Text(language.dont_have_account, style: TextStyles.tsP15B),
        )
      ],
    );
  }
}
