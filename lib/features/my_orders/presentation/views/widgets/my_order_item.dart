import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/colors_manger.dart';
import '../../../../../core/themes/text_styles.dart';

class MyOrderItem extends StatelessWidget {
  const MyOrderItem(
      {super.key,
      required this.productName,
      required this.price,
      required this.count});
  final String productName;
  final String count;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ColorsManger.green,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            productName,
            style: TextStyles.tsW15B,
          ),
          const Divider(),
          Row(
            children: [
              _FieldItem(
                title: "الكمية",
                value: count,
              ),
              _FieldItem(
                title: "السعر",
                value: price,
              ),
            ],
          ),
        ],
      ),
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
