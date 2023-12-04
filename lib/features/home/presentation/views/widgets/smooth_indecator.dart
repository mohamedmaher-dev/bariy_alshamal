import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/themes/colors_manger.dart';

class SmoothIndecator extends StatelessWidget {
  const SmoothIndecator({super.key, required this.indecator});
  final int indecator;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSmoothIndicator(
        count: 2,
        effect: const WormEffect(
          activeDotColor: ColorsManger.green,
          dotColor: ColorsManger.gold,
        ),
        activeIndex: indecator,
      ),
    );
  }
}
