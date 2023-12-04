part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeInitEvent extends HomeEvent {}

final class OneProdectSelect extends HomeEvent {
  final BuildContext context;
  final int index;
  OneProdectSelect({required this.index, required this.context});
}
