import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/colors_manger.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../core/widgets/buttom_nav_bar_view.dart';

class CartButtomBody extends StatelessWidget {
  const CartButtomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text(
          "اجمالي السعر هو 1400",
          textAlign: TextAlign.center,
          style: TextStyles.tsP15B,
        ),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: ElevatedButton.icon(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(ColorsManger.green),
              foregroundColor: MaterialStatePropertyAll(ColorsManger.white),
            ),
            onPressed: () {},
            icon: const Icon(Icons.done_all),
            label: Text(
              "تأكيد الشراء",
              style: TextStyles.tsW15B,
            ),
          ),
        ),
        const ButtomNavBarView()
      ],
    );
  }
}
