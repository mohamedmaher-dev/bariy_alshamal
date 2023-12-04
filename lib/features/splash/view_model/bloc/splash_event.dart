part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {}

final class SplashInitEvent extends SplashEvent {
  final BuildContext context;
  SplashInitEvent({required this.context});
}
