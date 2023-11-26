import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../core/themes/colors_manger.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: PinCodeTextField(
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50.h,
          fieldWidth: 50.w,
          inactiveColor: ColorsManger.gold,
          inactiveFillColor: ColorsManger.gold,
          selectedColor: Colors.white,
          selectedFillColor: ColorsManger.white,
          activeColor: ColorsManger.white,
          activeFillColor: ColorsManger.white,
        ),
        errorTextDirection: TextDirection.rtl,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        onCompleted: (v) {},
        onChanged: (value) {
          print(value);
        },
        appContext: context,
      ),
    );
  }
}
