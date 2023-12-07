part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class CartInitEvent extends CartEvent {}

final class DeleteCartItem extends CartEvent {
  final int index;
  DeleteCartItem({required this.index});
}

final class ConfirmCart extends CartEvent {}

final class GoToLogin extends CartEvent {
  final BuildContext context;
  GoToLogin({required this.context});
}

final class UsePromoCode extends CartEvent {}
