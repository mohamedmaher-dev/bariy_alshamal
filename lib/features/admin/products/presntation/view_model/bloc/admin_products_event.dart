part of 'admin_products_bloc.dart';

@immutable
sealed class AdminProductsEvent {}

final class AdminProductsInitEvent extends AdminProductsEvent {}

final class DeleteProductEvent extends AdminProductsEvent {
  final String productID;
  final String imageUrl;
  DeleteProductEvent({required this.productID, required this.imageUrl});
}

final class ChangeActiveEvent extends AdminProductsEvent {
  final String productID;
  final bool currentActive;
  ChangeActiveEvent({required this.productID, required this.currentActive});
}
