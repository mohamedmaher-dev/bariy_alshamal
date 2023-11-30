import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../themes/colors_manger.dart';

class AdminButtomNavBarView extends StatefulWidget {
  const AdminButtomNavBarView({super.key});

  @override
  State<AdminButtomNavBarView> createState() => _AdminButtomNavBarViewState();
}

class _AdminButtomNavBarViewState extends State<AdminButtomNavBarView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GNav(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      mainAxisAlignment: MainAxisAlignment.center,
      rippleColor: ColorsManger.white,
      tabBorderRadius: 100.r,
      color: ColorsManger.green,
      activeColor: Colors.white,
      tabBackgroundColor: ColorsManger.green,
      tabMargin: EdgeInsets.all(10.w),
      tabs: const [
        GButton(
          icon: Icons.add,
          text: "اضافة منتج",
        ),
        GButton(
          icon: Icons.grid_view_rounded,
          text: "المنتجات",
        ),
        GButton(
          icon: Icons.delivery_dining,
          text: "الطلبات",
        ),
        GButton(
          icon: Icons.group,
          text: "العملاء",
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
