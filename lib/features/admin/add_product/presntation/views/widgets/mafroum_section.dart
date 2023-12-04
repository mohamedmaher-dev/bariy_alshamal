import 'package:bariy_alshamal/features/admin/add_product/presntation/view_model/add_product_bloc/add_product_bloc.dart';
import 'package:flutter/material.dart';

import 'add_extra_dialog.dart';
import 'extra_item.dart';
import 'section_item.dart';

class MafroumSection extends StatelessWidget {
  const MafroumSection({super.key, required this.controller});
  final AddProductBloc controller;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SectionItem(
          name: "مفروم",
          onAdd: () {
            showDialog(
              context: context,
              builder: (contextDialog) => AddExtraDialog(
                controller: controller,
                onPressed: () {
                  controller.add(AddExtraMafroum());
                },
              ),
            );
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.mafroumList.length,
          itemBuilder: (context, index) => ExtraItem(
            details: controller.mafroumList[index].details,
            extraPrice: controller.mafroumList[index].price.toString(),
            onDelete: () {
              controller.add(DeleteExtraMafroum(index: index));
            },
          ),
        )
      ],
    );
  }
}
