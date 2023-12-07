part of 'promo_code_bloc.dart';

@immutable
sealed class PromoCodeState {}

final class PromoCodeInitial extends PromoCodeState {}

final class PromoCodeLoading extends PromoCodeState {}

final class PromoCodeFailed extends PromoCodeState {}

final class PromoCodeSuccess extends PromoCodeState {}

final class PromoCodeEmpty extends PromoCodeState {}
