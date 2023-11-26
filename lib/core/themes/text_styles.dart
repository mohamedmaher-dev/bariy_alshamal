import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_manger.dart';

abstract class TextStyles {
  static TextStyle tsW50B = TextStyle(
    color: ColorsManger.white,
    fontSize: 50.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle tsW35B = TextStyle(
    color: ColorsManger.white,
    fontSize: 35.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle tsW25B = TextStyle(
    color: ColorsManger.white,
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle tsW25N = TextStyle(
    color: ColorsManger.white,
    fontSize: 25.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle tsW20N = TextStyle(
    color: ColorsManger.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle tsW15N = TextStyle(
    color: ColorsManger.white,
    fontSize: 15.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle tsW12N = TextStyle(
    color: ColorsManger.white,
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle tsW10N = TextStyle(
    color: ColorsManger.white,
    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle tsW15B = TextStyle(
    color: ColorsManger.white,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle tsW10B = TextStyle(
    color: ColorsManger.white,
    fontSize: 10.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle tsP15B = TextStyle(
    color: ColorsManger.green,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle tsG15B = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManger.gold,
  );

  static TextStyle tsR15N = TextStyle(
    color: ColorsManger.red,
    fontSize: 15.sp,
    fontWeight: FontWeight.normal,
  );
}
