part of 'slider_manger_bloc.dart';

@immutable
sealed class SliderMangerState {}

final class SliderMangerInitial extends SliderMangerState {}

final class SliderMangerLoading extends SliderMangerState {}

final class SliderMangerFailed extends SliderMangerState {}

final class SliderMangerSuccess extends SliderMangerState {}

final class SliderMangerEmpty extends SliderMangerState {}
