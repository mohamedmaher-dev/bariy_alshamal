import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/themes/colors_manger.dart';

class ExtraItem extends StatelessWidget {
  const ExtraItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                ),
                filled: true,
                hintText: "التفاصيل",
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                ),
                filled: true,
                hintText: "التكلفة الاضافية",
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
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
