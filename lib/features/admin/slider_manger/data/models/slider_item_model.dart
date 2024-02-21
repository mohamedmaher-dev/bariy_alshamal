class SliderItemModel {
  final String url;
  SliderItemModel({required this.url});

  factory SliderItemModel.fromJson(Map<String, dynamic> json) =>
      SliderItemModel(
        url: json['url'],
      );
}
