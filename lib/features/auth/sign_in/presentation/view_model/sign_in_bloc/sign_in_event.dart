part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

final class SignInClick extends SignInEvent {
  final BuildContext context;
  SignInClick({required this.context});
}

final class CreateAccountClick extends SignInEvent {
  final BuildContext context;
  CreateAccountClick({required this.context});
}
