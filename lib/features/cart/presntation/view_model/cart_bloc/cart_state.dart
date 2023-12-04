part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {}

final class CartFailed extends CartState {}

final class CartEmpty extends CartState {}

final class CartNeedLogin extends CartState {}
