part of 'orders_bloc.dart';

@immutable
sealed class OrdersEvent {}

final class OrdersInitEvent extends OrdersEvent {}

final class DeleteOrderEvent extends OrdersEvent {
  final BuildContext context;
  final String orderID;
  DeleteOrderEvent({required this.orderID, required this.context});
}

final class ChangeOrderStatus extends OrdersEvent {
  final BuildContext context;
  final int newStatus;
  final String orderDocID;
  ChangeOrderStatus({
    required this.newStatus,
    required this.orderDocID,
    required this.context,
  });
}
