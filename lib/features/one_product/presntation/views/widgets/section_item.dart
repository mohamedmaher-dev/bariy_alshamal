import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/features/home/data/models/products/extra_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/text_styles.dart';

class SectionItem extends StatelessWidget {
  const SectionItem(
      {super.key,
      required this.title,
      required this.groupValue,
      required this.list,
      required this.onPressed,
      required this.onDelete});
  final String title;
  final String? groupValue;
  final List<ExtraModel> list;
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
                IconButton(
                  onPressed: (onDelete),
                  icon: const Icon(
                    Icons.delete,
                    color: ColorsManger.red,
                  ),
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
              itemCount: list.length,
              itemBuilder: (context, index) => RadioListTile(
                value: list[index].details,
                groupValue: groupValue,
                title: Text(list[index].details, style: TextStyles.tsP12B),
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
