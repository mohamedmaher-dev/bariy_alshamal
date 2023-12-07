part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class CreateAccountClick extends SignUpEvent {
  final BuildContext context;
  CreateAccountClick({required this.context});
}

final class AreadyHaveAccountClick extends SignUpEvent {
  final BuildContext context;
  AreadyHaveAccountClick({required this.context});
}

final class CitySelect extends SignUpEvent {
  final String city;
  CitySelect({required this.city});
}
