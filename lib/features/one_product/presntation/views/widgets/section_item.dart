import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/features/products/data/models/product_extra_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/text_styles.dart';

class SectionItem extends StatelessWidget {
  const SectionItem(
      {super.key,
      required this.title,
      required this.groupValue,
      required this.extra,
      required this.onPressed,
      required this.onDelete});
  final String title;
  final String? groupValue;
  final ProductExtraModel extra;
  final void Function(String?, int) onPressed;
  final void Function() onDelete;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Card(
          color: ColorsManger.green,
          margin: EdgeInsets.all(10.w),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyles.tsW15B,
                  ),
                ),
                groupValue != null
                    ? IconButton(
                        onPressed: (onDelete),
                        icon: const Icon(
                          Icons.clear_rounded,
                          color: ColorsManger.red,
                        ),
                      )
                    : const IconButton(
                        onPressed: null,
                        icon: SizedBox.shrink(),
                      )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Card(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: extra.list.length,
              itemBuilder: (context, index) => RadioListTile(
                value: extra.list[index].details,
                groupValue: groupValue,
                title:
                    Text(extra.list[index].details, style: TextStyles.tsP12B),
                onChanged: (value) {
                  onPressed(value, index);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
