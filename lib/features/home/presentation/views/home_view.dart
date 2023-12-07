// ignore_for_file: use_build_context_synchronously

import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/utils/app_manger.dart';
import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/features/home/presentation/views/widgets/category_section.dart';
import 'package:flutter/material.dart';
import 'widgets/slider_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(
        title: "الرئيسية",
        actions: [
          AppManger.isAdmin
              ? IconButton(
                  onPressed: () {
                    AppRoute.push(context: context, page: Pages.adminBoard);
                  },
                  icon: const Icon(
                    Icons.admin_panel_settings,
                    color: ColorsManger.gold,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: const [
          SliderView(),
          CategorySection(),
        ],
      ),
    );
  }
}
