part of 'add_product_bloc.dart';

@immutable
sealed class AddProductEvent {}

final class AddExtraSize extends AddProductEvent {}

final class DeleteExtraSize extends AddProductEvent {
  final int index;
  DeleteExtraSize({required this.index});
}

final class AddExtraPackage extends AddProductEvent {}

final class DeleteExtraPackage extends AddProductEvent {
  final int index;
  DeleteExtraPackage({required this.index});
}

final class AddExtraCutting extends AddProductEvent {}

final class DeleteExtraCutting extends AddProductEvent {
  final int index;
  DeleteExtraCutting({required this.index});
}

final class AddExtraHead extends AddProductEvent {}

final class DeleteExtraHead extends AddProductEvent {
  final int index;
  DeleteExtraHead({required this.index});
}

final class AddExtraMafroum extends AddProductEvent {}

final class DeleteExtraMafroum extends AddProductEvent {
  final int index;
  DeleteExtraMafroum({required this.index});
}

final class AddProduct extends AddProductEvent {}

final class PickImage extends AddProductEvent {}

final class TypeSelect extends AddProductEvent {
  final int newValue;
  TypeSelect({required this.newValue});
}
