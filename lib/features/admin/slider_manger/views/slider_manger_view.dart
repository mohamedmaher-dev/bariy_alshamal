import 'package:bariy_alshamal/features/admin/slider_manger/views/widgets/slider_manger_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/colors_manger.dart';
import '../../../../core/widgets/app_bar_view.dart';
import '../../admin_board/views/widgets/admin_drawer.dart';

class SliderManger extends StatelessWidget {
  const SliderManger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AdminDrawer(),
      appBar: const AppBarView(title: "سلايدر"),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsManger.green,
        foregroundColor: ColorsManger.white,
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
        ),
        itemCount: 5,
        itemBuilder: (context, index) => const SliderMangerItem(),
      ),
    );
  }
}
