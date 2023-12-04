import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/view_model/add_product_bloc/add_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'section_item.dart';

class GeneralSection extends StatelessWidget {
  const GeneralSection({super.key, required this.controller});
  final AddProductBloc controller;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const SectionItem(name: "اساسي", add: false),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Card(
            child: ListView(
              padding: EdgeInsets.all(10.w),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.productName,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                          ),
                          filled: true,
                          hintText: "اسم المنتج",
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: TextFormField(
                        controller: controller.productPrice,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                          ),
                          filled: true,
                          hintText: "سعر المنتج",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  controller: controller.productDetails,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                    filled: true,
                    hintText: "تفاصيل المنتج",
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        value: 0,
                        groupValue: controller.productType,
                        onChanged: (value) {
                          controller.add(TypeSelect(newValue: 0));
                        },
                        title: Text(
                          "منتجات بري",
                          style: TextStyles.tsP10B,
                        ),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        value: 1,
                        groupValue: controller.productType,
                        onChanged: (value) {
                          controller.add(TypeSelect(newValue: 1));
                        },
                        title: Text(
                          "منتجات اغنام",
                          style: TextStyles.tsP10B,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
