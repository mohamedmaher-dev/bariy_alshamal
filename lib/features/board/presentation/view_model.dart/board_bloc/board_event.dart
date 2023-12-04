part of 'board_bloc.dart';

@immutable
sealed class BoardEvent {}

final class PageViewerScroll extends BoardEvent {
  final int newIndex;
  PageViewerScroll({required this.newIndex});
}

final class NavClickEvent extends BoardEvent {
  final int newIndex;
  NavClickEvent({required this.newIndex});
}
