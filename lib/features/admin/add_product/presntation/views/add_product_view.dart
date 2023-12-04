import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/view_model/add_product_bloc/add_product_bloc.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/views/widgets/add_product_buttom_body.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/views/widgets/cutting_section.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/views/widgets/general_section.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/views/widgets/head_section.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/views/widgets/mafroum_section.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/views/widgets/package_section.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/views/widgets/sizes_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/themes/colors_manger.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    AddProductBloc controller = BlocProvider.of<AddProductBloc>(context);

    return BlocBuilder<AddProductBloc, AddProductState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarView(
            title: "اضافة منتج",
            actions: [
              IconButton(
                onPressed: () {
                  controller.add(PickImage());
                },
                icon: const Icon(
                  Icons.add_photo_alternate_rounded,
                  color: ColorsManger.white,
                ),
              )
            ],
          ),
          body: ListView(
            children: [
              GeneralSection(controller: controller),
              if (controller.productType == 0)
                SizesSection(controller: controller),
              if (controller.productType == 0)
                PackageSection(controller: controller),
              if (controller.productType == 0)
                CuttingSection(controller: controller),
              if (controller.productType == 0)
                HeadSection(controller: controller),
              if (controller.productType == 0)
                MafroumSection(controller: controller)
            ],
          ),
          bottomNavigationBar: AddProductButtomBody(controller: controller),
        );
      },
    );
  }
}
