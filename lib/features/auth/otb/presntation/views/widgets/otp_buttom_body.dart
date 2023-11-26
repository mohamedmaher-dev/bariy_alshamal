import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/localization/generated/l10n.dart';
import '../../../../../../core/themes/text_styles.dart';

class OtpButtomBody extends StatelessWidget {
  const OtpButtomBody({super.key});
  @override
  Widget build(BuildContext context) {
    Language language = Language.of(context);
    return ListView(
      shrinkWrap: true,
      children: [
        Center(
          child: Text(
            "الوقت المتبقي هو 56 ثانية",
            style: TextStyles.tsW15N,
          ),
        ),
        SizedBox(height: 25.h),
        TextButton(
          onPressed: () {},
          child: Text(
            language.wrong_phone,
            style: TextStyles.tsR15N,
          ),
        ),
      ],
    );
  }
}
