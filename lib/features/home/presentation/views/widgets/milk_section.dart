import 'package:bariy_alshamal/features/home/presentation/views/view_model/milk_products_bloc/milk_products_bloc.dart';
import 'package:bariy_alshamal/features/home/presentation/views/widgets/milk_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/colors_manger.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../core/widgets/empty_view.dart';

class MilkProductsSection extends StatelessWidget {
  const MilkProductsSection({super.key, required this.controller});
  final MilkProductsBloc controller;
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
        BlocBuilder<MilkProductsBloc, MilkProductsState>(
          builder: (context, state) {
            switch (state) {
              case MilkProductsInitial():
                return SizedBox(
                  height: 100.h,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              case MilkProductsLoading():
                return SizedBox(
                  height: 100.h,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              case MilkProductsSuccess():
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => MilkProductItem(
                    index: index,
                    productModel: controller.milkProducts.productsList[index],
                    controller: controller,
                  ),
                  itemCount: controller.milkProducts.productsList.length,
                );
              case MilkProductsEmpty():
                return SizedBox(
                  height: 100.h,
                  child: const EmptyViwe(),
                );
              case MilkProductsFailed():
                return SizedBox(
                  height: 100.h,
                  child: const Center(
                    child: Icon(Icons.error),
                  ),
                );
            }
          },
        )
      ],
    );
  }
}
