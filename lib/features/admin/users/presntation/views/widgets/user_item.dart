import 'package:flutter/material.dart';

import '../../../../../../core/themes/colors_manger.dart';
import '../../../../../../core/themes/text_styles.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsManger.green,
      child: ListTile(
        title: Text(
          "محمد ماهر",
          style: TextStyles.tsW15B,
        ),
        subtitle: Text(
          "0123456789",
          style: TextStyles.tsW12N,
        ),
        trailing: const Icon(
          Icons.copy,
          color: ColorsManger.gold,
        ),
      ),
    );
  }
}
