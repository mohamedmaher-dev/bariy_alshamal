import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors_manger.dart';

abstract class ButtonStyles {
  static ButtonStyle bsP = ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll(ColorsManger.green),
    foregroundColor: const MaterialStatePropertyAll(ColorsManger.white),
    minimumSize: MaterialStatePropertyAll(
      Size(double.infinity, 35.h),
    ),
  );
  static ButtonStyle bsT = ButtonStyle(
    side: MaterialStatePropertyAll(
      BorderSide(width: 1.w, color: ColorsManger.green),
    ),
    elevation: const MaterialStatePropertyAll(0),
    backgroundColor: const MaterialStatePropertyAll(ColorsManger.transparent),
    foregroundColor: const MaterialStatePropertyAll(ColorsManger.green),
    minimumSize: MaterialStatePropertyAll(
      Size(double.infinity, 35.h),
    ),
  );
}
