part of 'my_orders_bloc.dart';

@immutable
sealed class MyOrdersState {}

final class MyOrdersInitial extends MyOrdersState {}

final class MyOrdersLoading extends MyOrdersState {}

final class MyOrdersSeccess extends MyOrdersState {}

final class MyOrdersFailed extends MyOrdersState {}

final class MyOrdersEmpty extends MyOrdersState {}

final class MyOrdersNeedLoging extends MyOrdersState {}
