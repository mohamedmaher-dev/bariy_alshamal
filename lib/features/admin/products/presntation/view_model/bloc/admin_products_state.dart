part of 'admin_products_bloc.dart';

@immutable
sealed class AdminProductsState {}

final class AdminProductsInitial extends AdminProductsState {}

final class AdminProductsLoading extends AdminProductsState {}

final class AdminProductsSuccess extends AdminProductsState {}

final class AdminProductsEmpty extends AdminProductsState {}

final class AdminProductsFailed extends AdminProductsState {}
