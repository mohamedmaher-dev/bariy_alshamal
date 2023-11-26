import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/localization/generated/l10n.dart';
import '../../../../../../core/themes/text_styles.dart';

class OtpMsg extends StatelessWidget {
  const OtpMsg({super.key});

  @override
  Widget build(BuildContext context) {
    Language language = Language.of(context);
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      shrinkWrap: true,
      children: [
        Text(
          language.phone_number_confirm,
          style: TextStyles.tsW25B,
        ),
        Text(
          language.write_the_code,
          style: TextStyles.tsW15N,
        ),
      ],
    );
  }
}
