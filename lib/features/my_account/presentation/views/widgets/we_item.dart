import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/themes/colors_manger.dart';

class WeItem extends StatelessWidget {
  const WeItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.done,
        color: ColorsManger.green,
      ),
      title: Text(
        text,
        style: TextStyles.tsP15B,
      ),
    );
  }
}
