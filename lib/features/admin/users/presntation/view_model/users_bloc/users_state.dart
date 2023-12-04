part of 'users_bloc.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class UsersLoading extends UsersState {}

final class UsersSuccess extends UsersState {}

final class UsersFailed extends UsersState {}

final class UsersEmpty extends UsersState {}
