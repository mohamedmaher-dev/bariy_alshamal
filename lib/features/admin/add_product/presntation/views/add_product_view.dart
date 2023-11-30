import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/views/widgets/add_product_buttom_body.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/views/widgets/cutting_section.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/views/widgets/general_section.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/views/widgets/head_section.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/views/widgets/mafroum_section.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/views/widgets/package_section.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/views/widgets/sizes_section.dart';
import 'package:flutter/material.dart';
import '../../../../../core/themes/colors_manger.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(
        title: "اضافة منتج",
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_photo_alternate_rounded,
              color: ColorsManger.white,
            ),
          )
        ],
      ),
      bottomNavigationBar: const AddProductButtomBody(),
      body: ListView(
        children: const [
          GeneralSection(),
          SizesSection(),
          PackageSection(),
          CuttingSection(),
          HeadSection(),
          MafroumSection()
        ],
      ),
    );
  }
}
