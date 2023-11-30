import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'section_item.dart';

class GeneralSection extends StatelessWidget {
  const GeneralSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const SectionItem(name: "اساسي", add: false),
        Padding(
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
                    hintText: "اسم المنتج",
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
                    hintText: "سعر المنتج",
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
