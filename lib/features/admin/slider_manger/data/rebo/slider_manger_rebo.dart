import 'dart:io';

import 'package:bariy_alshamal/features/admin/slider_manger/data/models/slider_item_model.dart';

abstract class SliderMangerRebo {
  List<SliderItemModel> getSlider();
  addSliderItem(File file);
}
