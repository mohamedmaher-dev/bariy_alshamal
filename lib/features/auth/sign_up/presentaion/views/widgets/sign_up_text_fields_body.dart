import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:bariy_alshamal/features/auth/sign_up/presentaion/view_model/sign_up_bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/assets/assets_manger.dart';
import '../../../../../../core/localization/generated/l10n.dart';

class SignUpTextFieldsBody extends StatelessWidget {
  const SignUpTextFieldsBody({super.key});
  @override
  Widget build(BuildContext context) {
    Language language = Language.of(context);
    SignUpBloc controller = BlocProvider.of<SignUpBloc>(context);
    return Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              controller: controller.userName,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.r),
                  ),
                  borderSide: BorderSide.none,
                ),
                label: Text(language.user_name),
                filled: true,
                prefixIcon: const Icon(Icons.person),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "يجب كتابة اسم المستخدم";
                }
                return null;
              },
            ),
            SizedBox(height: 10.h),
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
