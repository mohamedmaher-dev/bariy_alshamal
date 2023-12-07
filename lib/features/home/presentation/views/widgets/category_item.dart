import 'package:bariy_alshamal/core/assets/assets_manger.dart';
import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:bariy_alshamal/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.name,
      required this.category,
      required this.controller});
  final HomeBloc controller;
  final String name;
  final int? category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: ColorsManger.green,
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(AssetsManger.categoryicon),
            ),
            Text(
              name,
              style: TextStyles.tsW18B,
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color:
                    category == null ? ColorsManger.green : ColorsManger.gold,
              ),
              title: Text(
                category == null ? "قريبا" : "متوفر الأن",
                style: category == null ? TextStyles.tsR10B : TextStyles.tsG10B,
                textAlign: TextAlign.center,
              ),
              leading: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorsManger.green,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        controller.add(CategorytSelect(category: category, context: context));
      },
    );
  }
}
