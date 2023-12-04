import 'package:bariy_alshamal/core/widgets/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/colors_manger.dart';
import '../../../../../core/themes/text_styles.dart';
import '../view_model/home_bloc/home_bloc.dart';
import 'product_item.dart';

class SheepsSection extends StatelessWidget {
  const SheepsSection({super.key, required this.controller});
  final HomeBloc controller;
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
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            switch (state) {
              case HomeInitial():
                return SizedBox(
                  height: 100.h,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              case HomeLoading():
                return SizedBox(
                  height: 100.h,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              case HomeSuccess():
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ProductItemView(
                    index: index,
                    productModel: controller.products.productsList[index],
                    controller: controller,
                  ),
                  itemCount: controller.products.productsList.length,
                );
              case HomeEmpty():
                return SizedBox(
                  height: 100.h,
                  child: const EmptyViwe(),
                );
              case HomeFailed():
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
