import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/themes/colors_manger.dart';

class ExtraItem extends StatelessWidget {
  const ExtraItem(
      {super.key,
      required this.details,
      required this.extraPrice,
      required this.onDelete});
  final String details;
  final String extraPrice;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Text(
                  details,
                  style: TextStyles.tsP10B,
                ),
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Text(
                  extraPrice,
                  style: TextStyles.tsP10B,
                ),
              ),
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
    );
  }
}
