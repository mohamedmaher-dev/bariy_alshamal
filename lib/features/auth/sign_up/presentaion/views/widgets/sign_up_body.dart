import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:bariy_alshamal/features/auth/sign_up/presentaion/view_model/sign_up_bloc/sign_up_bloc.dart';
import 'package:bariy_alshamal/features/auth/sign_up/presentaion/views/widgets/sign_up_buttons_body.dart';
import 'package:bariy_alshamal/features/auth/sign_up/presentaion/views/widgets/sign_up_text_fields_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});
  @override
  Widget build(BuildContext context) {
    SignUpBloc controller = BlocProvider.of<SignUpBloc>(context);

    return Card(
      margin: const EdgeInsets.all(10).h,
      child: ListView(
        padding: const EdgeInsets.all(10).h,
        shrinkWrap: true,
        children: [
          const SignUpTextFieldsBody(),
          SizedBox(height: 10.h),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text(
                        "الرياض",
                        style: TextStyles.tsP12B,
                      ),
                      value: "الرياض",
                      groupValue: controller.city,
                      onChanged: (value) {
                        controller.add(CitySelect(city: value!));
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text(
                        "حفر الباطن",
                        style: TextStyles.tsP12B,
                      ),
                      value: "حفر الباطن",
                      groupValue: controller.city,
                      onChanged: (value) {
                        controller.add(CitySelect(city: value!));
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 10.h),
          const SignUpButtonsBody(),
        ],
      ),
    );
  }
}
