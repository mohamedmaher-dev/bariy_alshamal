import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../themes/colors_manger.dart';
import '../themes/text_styles.dart';

class AppBarView extends StatelessWidget implements PreferredSize {
  const AppBarView({super.key, required this.title, this.actions});
  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManger.green,
      title: Text(
        title,
        style: TextStyles.tsW15B,
      ),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size(double.infinity, 40.h);
}
