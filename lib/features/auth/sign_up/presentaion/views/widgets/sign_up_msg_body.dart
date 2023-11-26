import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/localization/generated/l10n.dart';
import '../../../../../../core/themes/text_styles.dart';

class SignUpMsgBody extends StatelessWidget {
  const SignUpMsgBody({super.key});

  @override
  Widget build(BuildContext context) {
    Language language = Language.of(context);
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      shrinkWrap: true,
      children: [
        Text(
          language.welcome,
          style: TextStyles.tsW35B,
        ),
        Text(
          language.sign_up_msg1,
          style: TextStyles.tsW15N,
        ),
        Text(
          language.sign_up_msg2,
          style: TextStyles.tsW15N,
        ),
      ],
    );
  }
}
