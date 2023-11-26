import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets/assets_manger.dart';
import '../../../../../../core/localization/generated/l10n.dart';

class SignInTextFieldsBody extends StatelessWidget {
  const SignInTextFieldsBody({super.key});

  @override
  Widget build(BuildContext context) {
    Language language = Language.of(context);
    return Form(
        child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.r),
              ),
              borderSide: BorderSide.none,
            ),
            label: Text(language.phone_number),
            filled: true,
            prefixIcon: const Icon(Icons.phone),
            suffixIcon: Padding(
              padding: EdgeInsets.all(5.w),
              child: Image.asset(
                AssetsManger.saIcon,
                height: 10.h,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
