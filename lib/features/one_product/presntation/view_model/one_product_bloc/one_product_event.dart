part of 'one_product_bloc.dart';

@immutable
sealed class OneProductEvent {}

final class OneProductInitEvent extends OneProductEvent {}

final class SizeSelect extends OneProductEvent {
  final int index;
  SizeSelect({required this.index});
}

final class SizeDelete extends OneProductEvent {}

final class PackgesSelect extends OneProductEvent {
  final int index;
  PackgesSelect({required this.index});
}

final class PackgesDelete extends OneProductEvent {}

final class CuttingsSelect extends OneProductEvent {
  final int index;
  CuttingsSelect({required this.index});
}

final class CuttingsDelete extends OneProductEvent {}

final class MafroumSelect extends OneProductEvent {
  final int index;
  MafroumSelect({required this.index});
}

final class MafroumDelete extends OneProductEvent {}

final class HeadSelect extends OneProductEvent {
  final int index;
  HeadSelect({required this.index});
}

final class HeadDelete extends OneProductEvent {}

final class IncreaseCount extends OneProductEvent {}

final class DecreaseCount extends OneProductEvent {}

final class AddOrderToCart extends OneProductEvent {
  final BuildContext context;
  AddOrderToCart({required this.context});
}
