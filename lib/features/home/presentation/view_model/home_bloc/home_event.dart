part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class CategorytSelect extends HomeEvent {
  final BuildContext context;
  final int? category;
  CategorytSelect({
    required this.category,
    required this.context,
  });
}
