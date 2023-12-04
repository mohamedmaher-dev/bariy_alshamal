part of 'otp_bloc.dart';

@immutable
sealed class OtpEvent {}

final class OtpInitEvent extends OtpEvent {
  final BuildContext context;
  OtpInitEvent({required this.context});
}

final class PhoneIncorrectClick extends OtpEvent {
  final BuildContext context;
  PhoneIncorrectClick({required this.context});
}

final class OtpComplete extends OtpEvent {
  final BuildContext context;
  final String otpCode;
  OtpComplete({required this.context, required this.otpCode});
}
