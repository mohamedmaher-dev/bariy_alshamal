part of 'slider_manger_bloc.dart';

@immutable
sealed class SliderMangerEvent {}

final class AddImage extends SliderMangerEvent {}

final class DeleteImage extends SliderMangerEvent {}
