part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

final class ProductsInitEvent extends ProductsEvent {
  final BuildContext context;
  ProductsInitEvent({required this.context});
}

final class ProductClickEvent extends ProductsEvent {
  final ProductModel productModel;
  final BuildContext context;
  ProductClickEvent({required this.productModel, required this.context});
}
