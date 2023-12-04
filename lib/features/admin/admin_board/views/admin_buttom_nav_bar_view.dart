import 'package:bariy_alshamal/features/admin/admin_board/view_model/admin_board_bloc/admin_board_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/themes/colors_manger.dart';

class AdminButtomNavBarView extends StatelessWidget {
  const AdminButtomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    AdminBoardBloc controller = BlocProvider.of<AdminBoardBloc>(context);
    return BlocBuilder<AdminBoardBloc, AdminBoardState>(
      builder: (context, state) {
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
          selectedIndex: controller.currentIndex,
          onTabChange: (value) {
            controller.add(NavClickEvent(newIndex: value));
          },
        );
      },
    );
  }
}
