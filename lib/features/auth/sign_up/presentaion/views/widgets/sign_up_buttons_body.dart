import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/localization/generated/l10n.dart';
import '../../../../../../core/themes/button_styles.dart';
import '../../view_model/sign_up_bloc/sign_up_bloc.dart';

class SignUpButtonsBody extends StatelessWidget {
  const SignUpButtonsBody({super.key});

  @override
  Widget build(BuildContext context) {
    Language language = Language.of(context);
    SignUpBloc controller = BlocProvider.of<SignUpBloc>(context);

    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            controller.add(CreateAccountClick(context: context));
          },
          style: ButtonStyles.bsP,
          child: Text(language.create_account, style: TextStyles.tsW15B),
        ),
        SizedBox(height: 10.h),
        ElevatedButton(
          onPressed: () {
            controller.add(AreadyHaveAccountClick(context: context));
          },
          style: ButtonStyles.bsT,
          child: Text(language.already_have_account, style: TextStyles.tsP15B),
        )
      ],
    );
  }
}
