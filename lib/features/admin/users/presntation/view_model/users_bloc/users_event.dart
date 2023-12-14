part of 'users_bloc.dart';

@immutable
sealed class UsersEvent {}

final class UsersInitEvent extends UsersEvent {}

final class SendNotifi extends UsersEvent {}
