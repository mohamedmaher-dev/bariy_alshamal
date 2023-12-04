part of 'milk_products_bloc.dart';

@immutable
sealed class MilkProductsEvent {}

final class MilkProductsInitEvent extends MilkProductsEvent {}

final class OneProdectSelect extends MilkProductsEvent {
  final BuildContext context;
  final int index;
  OneProdectSelect({required this.index, required this.context});
}
