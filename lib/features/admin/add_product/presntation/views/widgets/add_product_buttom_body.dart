import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/themes/colors_manger.dart';
import '../../../../../../core/themes/text_styles.dart';
import '../../../../../../core/widgets/admin_buttom_nav_bar_view.dart';

class AddProductButtomBody extends StatelessWidget {
  const AddProductButtomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.all(10.w),
          child: ElevatedButton.icon(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(ColorsManger.green),
              foregroundColor: MaterialStatePropertyAll(ColorsManger.white),
            ),
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: Text(
              "اضافة المنتج",
              style: TextStyles.tsW15B,
            ),
          ),
        ),
        const AdminButtomNavBarView(),
      ],
    );
  }
}