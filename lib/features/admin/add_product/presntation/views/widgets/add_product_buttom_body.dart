import 'package:bariy_alshamal/features/admin/add_product/presntation/view_model/add_product_bloc/add_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/themes/colors_manger.dart';
import '../../../../../../core/themes/text_styles.dart';

class AddProductButtomBody extends StatelessWidget {
  const AddProductButtomBody({super.key, required this.controller});
  final AddProductBloc controller;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.all(10.w),
          child: ElevatedButton.icon(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(ColorsManger.green),
              foregroundColor: MaterialStatePropertyAll(ColorsManger.white),
            ),
            onPressed: () {
              controller.add(AddProduct());
            },
            icon: const Icon(Icons.add),
            label: Text(
              "اضافة المنتج",
              style: TextStyles.tsW15B,
            ),
          ),
        ),
      ],
    );
  }
}
