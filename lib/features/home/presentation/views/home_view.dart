// ignore_for_file: use_build_context_synchronously

import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/utils/app_manger.dart';
import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/features/home/presentation/views/view_model/milk_products_bloc/milk_products_bloc.dart';
import 'package:bariy_alshamal/features/home/presentation/views/widgets/sheeps_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view_model/home_bloc/home_bloc.dart';
import 'widgets/milk_section.dart';
import 'widgets/slider_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeBloc controller;
  late MilkProductsBloc milkProductsController;

  @override
  void initState() {
    controller = BlocProvider.of<HomeBloc>(context);
    milkProductsController = BlocProvider.of<MilkProductsBloc>(context);
    controller.add(HomeInitEvent());
    milkProductsController.add(MilkProductsInitEvent());
    super.initState();
  }

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
        children: [
          const SliderView(),
          SheepsSection(controller: controller),
          MilkProductsSection(controller: milkProductsController),
        ],
      ),
    );
  }
}
