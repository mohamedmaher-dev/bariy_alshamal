import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/themes/colors_manger.dart';
import '../../../../../../core/themes/text_styles.dart';

class SectionItem extends StatelessWidget {
  const SectionItem({super.key, required this.name, this.add});
  final String name;
  final bool? add;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Card(
        color: ColorsManger.green,
        child: ListTile(
          title: Text(
            name,
            style: TextStyles.tsW15B,
          ),
          trailing: add == null || add == true
              ? const Icon(
                  Icons.add,
                  color: ColorsManger.white,
                )
              : null,
        ),
      ),
    );
  }
}
