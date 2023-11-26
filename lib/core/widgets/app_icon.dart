import 'package:bariy_alshamal/core/assets/assets_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsManger.appIconWithoutBack,
      height: 150.h,
    );
  }
}
