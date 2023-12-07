part of 'my_orders_bloc.dart';

@immutable
sealed class MyOrdersEvent {}

final class MyOrdersInitEvent extends MyOrdersEvent {}
