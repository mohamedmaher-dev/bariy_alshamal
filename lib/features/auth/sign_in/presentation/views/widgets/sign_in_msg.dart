import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/localization/generated/l10n.dart';
import '../../../../../../core/themes/text_styles.dart';

class SignInMsg extends StatelessWidget {
  const SignInMsg({super.key});

  @override
  Widget build(BuildContext context) {
    Language language = Language.of(context);
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      shrinkWrap: true,
      children: [
        Text(
          language.welcome_back,
          style: TextStyles.tsW35B,
        ),
        Text(
          language.sign_in_msg1,
          style: TextStyles.tsW15N,
        ),
        Text(
          language.sign_in_msg2,
          style: TextStyles.tsW15N,
        ),
      ],
    );
  }
}
