import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/colors_manger.dart';
import '../../../../../core/themes/text_styles.dart';

class MilkItem extends StatelessWidget {
  const MilkItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorsManger.green,
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2,
                child: Image.asset("assets/images/sheep_icon.png"),
              ),
              Expanded(
                child: Text(
                  "لبن ماعز",
                  textAlign: TextAlign.center,
                  style: TextStyles.tsW15B,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
