import 'package:bariy_alshamal/features/admin/add_product/presntation/view_model/add_product_bloc/add_product_bloc.dart';
import 'package:flutter/material.dart';

import 'add_extra_dialog.dart';
import 'extra_item.dart';
import 'section_item.dart';

class HeadSection extends StatelessWidget {
  const HeadSection({super.key, required this.controller});
  final AddProductBloc controller;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SectionItem(
          name: "الرأس",
          onAdd: () {
            showDialog(
              context: context,
              builder: (contextDialog) => AddExtraDialog(
                controller: controller,
                onPressed: () {
                  controller.add(AddExtraHead());
                },
              ),
            );
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.headList.length,
          itemBuilder: (context, index) => ExtraItem(
            details: controller.headList[index].details,
            extraPrice: controller.headList[index].price.toString(),
            onDelete: () {
              controller.add(DeleteExtraHead(index: index));
            },
          ),
        )
      ],
    );
  }
}
