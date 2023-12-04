part of 'admin_board_bloc.dart';

@immutable
sealed class AdminBoardEvent {}

final class PageViewerScroll extends AdminBoardEvent {
  final int newIndex;
  PageViewerScroll({required this.newIndex});
}

final class NavClickEvent extends AdminBoardEvent {
  final int newIndex;
  NavClickEvent({required this.newIndex});
}
