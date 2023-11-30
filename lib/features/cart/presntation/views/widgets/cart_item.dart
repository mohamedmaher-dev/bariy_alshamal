import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/colors_manger.dart';
import '../../../../../core/themes/text_styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
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
                  "ذبيحة تيس بلدي كاملة",
                  style: TextStyles.tsW15B,
                ),
                const Divider(),
                const Row(
                  children: [
                    _FieldItem(title: "الكمية", value: "2"),
                    _FieldItem(title: "السعر", value: "700"),
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
