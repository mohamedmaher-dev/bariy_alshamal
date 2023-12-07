part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSeccess extends ProductsState {}

final class ProductsdFailed extends ProductsState {}

final class ProductsEmpty extends ProductsState {}
