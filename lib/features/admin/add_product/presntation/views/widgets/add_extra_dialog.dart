import 'package:bariy_alshamal/features/admin/add_product/presntation/view_model/add_product_bloc/add_product_bloc.dart';
import 'package:flutter/material.dart';

class AddExtraDialog extends StatelessWidget {
  const AddExtraDialog({super.key, this.onPressed, required this.controller});
  final AddProductBloc controller;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("اضافات"),
      content: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextField(
              controller: controller.extraDetails,
              decoration: const InputDecoration(hintText: "التفاصيل"),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              controller: controller.extraPrice,
              decoration: const InputDecoration(hintText: "السعر"),
            ),
          )
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (onPressed != null) {
              onPressed!();
            }
            Navigator.pop(context);
          },
          child: const Text("اضف"),
        )
      ],
    );
  }
}
