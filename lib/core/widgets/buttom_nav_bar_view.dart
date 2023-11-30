import 'package:bariy_alshamal/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../themes/colors_manger.dart';

class ButtomNavBarView extends StatefulWidget {
  const ButtomNavBarView({super.key});

  @override
  State<ButtomNavBarView> createState() => _ButtomNavBarViewState();
}

class _ButtomNavBarViewState extends State<ButtomNavBarView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Language language = Language.of(context);
    return GNav(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      mainAxisAlignment: MainAxisAlignment.center,
      rippleColor: ColorsManger.white,
      tabBorderRadius: 100.r,
      color: ColorsManger.green,
      activeColor: Colors.white,
      tabBackgroundColor: ColorsManger.green,
      tabMargin: EdgeInsets.all(10.w),
      tabs: [
        GButton(
          icon: Icons.shopping_cart_rounded,
          text: language.cart,
        ),
        GButton(
          icon: Icons.home,
          text: language.home,
        ),
        GButton(
          icon: Icons.account_circle,
          text: language.my_account,
        ),
      ],
      selectedIndex: currentIndex,
      onTabChange: (value) {
        setState(() {
          currentIndex = value;
        });
      },
    );
  }
}
