import 'package:bariy_alshamal/features/cart/presntation/view_model/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/colors_manger.dart';
import '../../../../../core/themes/text_styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.controller,
    required this.index,
  });
  final CartBloc controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            controller.add(DeleteCartItem(index: index));
          },
          icon: const Icon(
            Icons.delete,
            color: ColorsManger.red,
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: ColorsManger.green,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.cartItems.list[index].productName,
                  style: TextStyles.tsW15B,
                ),
                const Divider(),
                Row(
                  children: [
                    _FieldItem(
                      title: "الكمية",
                      value: controller.cartItems.list[index].count.toString(),
                    ),
                    _FieldItem(
                      title: "السعر",
                      value: controller.cartItems.list[index].totalPrice
                          .toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _FieldItem extends StatelessWidget {
  const _FieldItem({required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        title: Text(
          title,
          style: TextStyles.tsW10B,
        ),
        subtitle: Container(
          decoration: BoxDecoration(
            color: ColorsManger.white,
            borderRadius: BorderRadius.all(
              Radius.circular(100.r),
            ),
          ),
          child: Text(
            value,
            style: TextStyles.tsP12B,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
