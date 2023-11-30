import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/themes/colors_manger.dart';
import '../../../../../../core/themes/text_styles.dart';

class FieldItem extends StatelessWidget {
  const FieldItem({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        title: Text(
          title,
          style: TextStyles.tsW12N,
        ),
        subtitle: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(3.w),
          padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: ColorsManger.white,
          ),
          child: Text(
            value,
            style: TextStyles.tsP12B,
          ),
        ),
      ),
    );
  }
}
