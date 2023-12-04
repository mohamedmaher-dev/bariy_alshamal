import 'package:bariy_alshamal/features/cart/presntation/view_model/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/colors_manger.dart';
import '../../../../../core/themes/text_styles.dart';

class CartButtomBody extends StatelessWidget {
  const CartButtomBody({super.key, required this.controller});
  final CartBloc controller;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text(
          "اجمالي السعر هو ${controller.totalPrice} ريال سعودي",
          textAlign: TextAlign.center,
          style: TextStyles.tsP15B,
        ),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: ElevatedButton.icon(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(ColorsManger.green),
              foregroundColor: MaterialStatePropertyAll(ColorsManger.white),
            ),
            onPressed: () {
              controller.add(ConfirmCart());
            },
            icon: const Icon(Icons.done_all),
            label: Text(
              "تأكيد الشراء",
              style: TextStyles.tsW15B,
            ),
          ),
        ),
      ],
    );
  }
}
