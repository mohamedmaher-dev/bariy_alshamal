import 'package:bariy_alshamal/core/localization/generated/l10n.dart';
import 'package:bariy_alshamal/features/board/presentation/view_model.dart/board_bloc/board_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../../core/themes/colors_manger.dart';

class ButtomNavBarView extends StatelessWidget {
  const ButtomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    BoardBloc controller = BlocProvider.of<BoardBloc>(context);
    Language language = Language.of(context);
    return BlocBuilder<BoardBloc, BoardState>(
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
          selectedIndex: controller.currentIndex,
          onTabChange: (value) {
            controller.add(NavClickEvent(newIndex: value));
          },
        );
      },
    );
  }
}
