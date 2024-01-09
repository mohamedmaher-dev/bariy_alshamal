import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../assets/assets_manger.dart';

class EmptyViwe extends StatelessWidget {
  const EmptyViwe({super.key, required this.arText, required this.enText});
  final String arText;
  final String enText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetsManger.emptyImage,
          height: 75.h,
        ),
        Text(
          arText,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.h),
        Text(
          enText,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
