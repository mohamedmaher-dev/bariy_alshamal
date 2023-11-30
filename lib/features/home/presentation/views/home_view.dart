import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/features/home/presentation/views/widgets/milk_section.dart';
import 'package:bariy_alshamal/features/home/presentation/views/widgets/sheeps_section.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/buttom_nav_bar_view.dart';
import 'widgets/slider_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(title: "الرئيسية"),
      bottomNavigationBar: const ButtomNavBarView(),
      body: ListView(
        shrinkWrap: true,
        children: const [
          SliderView(),
          MilkProductsSection(),
          SheepsSection(),
        ],
      ),
    );
  }
}
