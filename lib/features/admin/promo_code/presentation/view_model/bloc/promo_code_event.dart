part of 'promo_code_bloc.dart';

@immutable
sealed class PromoCodeEvent {}

final class PromoCodeInit extends PromoCodeEvent {}

final class AddPromoCode extends PromoCodeEvent {}

final class DeletePromoCode extends PromoCodeEvent {
  final String code;
  DeletePromoCode({required this.code});
}
