import 'package:bariy_alshamal/core/utils/popup_loading_manger.dart';
import 'package:bariy_alshamal/features/admin/users/presntation/view_model/users_bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/themes/colors_manger.dart';
import '../../../../../../core/themes/text_styles.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key, required this.controller, required this.index});
  final UsersBloc controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsManger.green,
      child: ListTile(
        title: Text(
          controller.users.list[index].userName,
          style: TextStyles.tsW15B,
        ),
        subtitle: Text(
          controller.users.list[index].userPhone.toString(),
          style: TextStyles.tsW12N,
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.copy,
            color: ColorsManger.gold,
          ),
          onPressed: () async {
            await Clipboard.setData(
              ClipboardData(
                text: controller.users.list[index].userPhone.toString(),
              ),
            );
            PopUpLoading.success("تم نسخ الرقم");
          },
        ),
      ),
    );
  }
}
