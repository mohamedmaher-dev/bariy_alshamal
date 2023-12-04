import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/features/admin/products/presntation/view_model/bloc/admin_products_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/themes/colors_manger.dart';
import '../../../../../../core/themes/text_styles.dart';

class AdminProductItem extends StatelessWidget {
  const AdminProductItem(
      {super.key, required this.controller, required this.index});

  final int index;
  final AdminProductsBloc controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ColorsManger.green,
      ),
      child: GestureDetector(
        child: Container(
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
                    imageUrl: controller.products.list[index].imageUrl,
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
                  controller.products.list[index].productName,
                  textAlign: TextAlign.center,
                  style: TextStyles.tsW15B,
                ),
                subtitle: Text(
                  controller.products.list[index].isActive
                      ? "متوفر الأن"
                      : "غير متوفر الان",
                  textAlign: TextAlign.center,
                  style: controller.products.list[index].isActive
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
          showModalBottomSheet(
            showDragHandle: true,
            context: context,
            builder: (contextSheet) {
              return ListView(
                padding: EdgeInsets.all(10.w),
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text(
                      controller.products.list[index].productName,
                      style: TextStyles.tsP15B,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        controller.products.list[index].isActive
                            ? ColorsManger.gold
                            : ColorsManger.green,
                      ),
                      foregroundColor:
                          const MaterialStatePropertyAll(ColorsManger.white),
                    ),
                    onPressed: () {
                      AppRoute.pop(context: context);
                      controller.add(
                        ChangeActiveEvent(
                            productID:
                                controller.products.list[index].productId,
                            currentActive:
                                controller.products.list[index].isActive),
                      );
                    },
                    icon: const Icon(Icons.grid_view_rounded),
                    label: Text(
                      controller.products.list[index].isActive
                          ? "تعيين غير متاح"
                          : "تعيين متاح",
                    ),
                  ),
                  ElevatedButton.icon(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(ColorsManger.red),
                      foregroundColor:
                          MaterialStatePropertyAll(ColorsManger.white),
                    ),
                    onPressed: () {
                      AppRoute.pop(context: context);
                      controller.add(
                        DeleteProductEvent(
                          imageUrl: controller.products.list[index].imageUrl,
                          productID: controller.products.list[index].productId,
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text("حذف المنتج"),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
