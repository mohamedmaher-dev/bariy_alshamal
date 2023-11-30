import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets/assets_manger.dart';
import '../../../../../../core/themes/colors_manger.dart';
import '../../../../../../core/themes/text_styles.dart';

class AdminProductItem extends StatelessWidget {
  const AdminProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ColorsManger.green,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  "ذبيحة تيس بلدي كاملة",
                  style: TextStyles.tsW15B,
                ),
                Text(
                  "السعر: 700 ريال سعودي",
                  style: TextStyles.tsW12N,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.indeterminate_check_box_outlined,
                      ),
                      label: const Text("نفذت الكميه"),
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(ColorsManger.gold),
                        foregroundColor:
                            MaterialStatePropertyAll(ColorsManger.white),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                      ),
                      label: const Text("حذف"),
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(ColorsManger.red),
                        foregroundColor:
                            MaterialStatePropertyAll(ColorsManger.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(
                AssetsManger.imageProductTest,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
