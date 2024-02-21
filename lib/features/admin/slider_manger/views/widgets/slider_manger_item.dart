import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/colors_manger.dart';

class SliderMangerItem extends StatelessWidget {
  const SliderMangerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ColorsManger.green,
      ),
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: CachedNetworkImage(
                imageUrl:
                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
                progressIndicatorBuilder: (context, url, progress) =>
                    const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManger.gold,
                  ),
                ),
                fit: BoxFit.fill,
              ),
            ),
            Align(
              child: IconButton.filled(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: ColorsManger.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
