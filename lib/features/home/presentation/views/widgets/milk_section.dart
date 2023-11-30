import 'package:bariy_alshamal/features/home/presentation/views/widgets/milk_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/colors_manger.dart';
import '../../../../../core/themes/text_styles.dart';

class MilkProductsSection extends StatelessWidget {
  const MilkProductsSection({super.key});

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
                "منتجات الأغنام",
                style: TextStyles.tsW15B,
              ),
            ),
          ),
        ),
        CarouselSlider.builder(
          itemCount: 5,
          itemBuilder: (context, index, realIndex) {
            return const MilkItem();
          },
          options: CarouselOptions(
            height: 200,
            viewportFraction: 0.5,
            enableInfiniteScroll: false,
          ),
        ),
      ],
    );
  }
}
