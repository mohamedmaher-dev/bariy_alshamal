import 'package:bariy_alshamal/features/admin/add_product/presntation/view_model/add_product_bloc/add_product_bloc.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/views/widgets/add_extra_dialog.dart';
import 'package:flutter/material.dart';
import 'extra_item.dart';
import 'section_item.dart';

class SizesSection extends StatelessWidget {
  const SizesSection({super.key, required this.controller});
  final AddProductBloc controller;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SectionItem(
          name: "الأحجام",
          onAdd: () {
            showDialog(
              context: context,
              builder: (contextDialog) => AddExtraDialog(
                controller: controller,
                onPressed: () {
                  controller.add(AddExtraSize());
                },
              ),
            );
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.sizesList.length,
          itemBuilder: (context, index) => ExtraItem(
            details: controller.sizesList[index].details,
            extraPrice: controller.sizesList[index].price.toString(),
            onDelete: () {
              controller.add(DeleteExtraSize(index: index));
            },
          ),
        )
      ],
    );
  }
}
