import 'package:bariy_alshamal/features/auth/sign_in/presentation/view_model/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets/assets_manger.dart';
import '../../../../../../core/localization/generated/l10n.dart';
import '../../../../../../core/themes/text_styles.dart';

class SignInTextFieldsBody extends StatelessWidget {
  const SignInTextFieldsBody({super.key, required this.controller});
  final SignInBloc controller;
  @override
  Widget build(BuildContext context) {
    Language language = Language.of(context);
    return Form(
        autovalidateMode: AutovalidateMode.always,
        key: controller.formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.userPhone,
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
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "يجب كتابة رقم الهاتف";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.w),
                  child: Text(
                    "+966",
                    textDirection: TextDirection.ltr,
                    style: TextStyles.tsP10B,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.w),
                  child: Image.asset(
                    AssetsManger.saIcon,
                    height: 25.h,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
