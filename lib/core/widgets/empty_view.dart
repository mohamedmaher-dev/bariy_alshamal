import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../assets/assets_manger.dart';

class EmptyViwe extends StatelessWidget {
  const EmptyViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AssetsManger.emptyImage,
        height: 150.h,
      ),
    );
  }
}
