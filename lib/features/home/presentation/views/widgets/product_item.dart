import 'package:bariy_alshamal/features/home/data/models/products/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/colors_manger.dart';
import '../../../../../core/themes/text_styles.dart';
import '../view_model/home_bloc/home_bloc.dart';

class ProductItemView extends StatelessWidget {
  const ProductItemView(
      {super.key,
      required this.index,
      required this.productModel,
      required this.controller});
  final HomeBloc controller;
  final int index;
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: ColorsManger.green,
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            AspectRatio(
              aspectRatio: 3 / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: CachedNetworkImage(
                  imageUrl: productModel.imageUrl,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManger.gold,
                    ),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              title: Text(
                productModel.productName,
                textAlign: TextAlign.center,
                style: TextStyles.tsW15B,
              ),
              subtitle: Text(
                productModel.isActive ? "متوفر الأن" : "غير متوفر الان",
                textAlign: TextAlign.center,
                style: productModel.isActive
                    ? TextStyles.tsG10B
                    : TextStyles.tsR10B,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorsManger.gold,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        controller.add(OneProdectSelect(index: index, context: context));
      },
    );
  }
}
