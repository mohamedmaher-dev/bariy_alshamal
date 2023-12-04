part of 'orders_bloc.dart';

@immutable
sealed class OrdersEvent {}

final class OrdersInitEvent extends OrdersEvent {}

final class DeleteOrderEvent extends OrdersEvent {
  final String orderID;
  DeleteOrderEvent({required this.orderID});
}
