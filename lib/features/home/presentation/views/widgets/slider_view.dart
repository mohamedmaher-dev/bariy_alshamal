import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/assets_manger.dart';
import 'slider_item.dart';
import 'smooth_indecator.dart';

class SliderView extends StatefulWidget {
  const SliderView({super.key});

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  int currentIndex = 0;
  int indecator = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CarouselSlider(
          items: const [
            SliderItem(image: AssetsManger.slider1),
          ],
          options: CarouselOptions(
            aspectRatio: 16 / 11,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                indecator = index;
              });
            },
          ),
        ),
        SmoothIndecator(indecator: indecator),
      ],
    );
  }
}
