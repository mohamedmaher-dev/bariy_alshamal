part of 'milk_products_bloc.dart';

@immutable
sealed class MilkProductsState {}

final class MilkProductsInitial extends MilkProductsState {}

final class MilkProductsLoading extends MilkProductsState {}

final class MilkProductsSuccess extends MilkProductsState {}

final class MilkProductsEmpty extends MilkProductsState {}

final class MilkProductsFailed extends MilkProductsState {}
