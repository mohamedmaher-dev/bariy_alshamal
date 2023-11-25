import 'package:bariy_alshamal/core/assets/assets_manger.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsManger.appIcon,
      height: 200,
    );
  }
}
