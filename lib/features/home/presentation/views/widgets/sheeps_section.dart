import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/colors_manger.dart';
import '../../../../../core/themes/text_styles.dart';
import 'sheep_item.dart';

class SheepsSection extends StatelessWidget {
  const SheepsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Card(
            color: ColorsManger.green,
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Text(
                "بري الشمال",
                style: TextStyles.tsW15B,
              ),
            ),
          ),
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => SheepItem(index: index),
          itemCount: 5,
        )
      ],
    );
  }
}
