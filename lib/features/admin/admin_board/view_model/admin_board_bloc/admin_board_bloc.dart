// ignore_for_file: depend_on_referenced_packages, unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'admin_board_event.dart';
part 'admin_board_state.dart';

class AdminBoardBloc extends Bloc<AdminBoardEvent, AdminBoardState> {
  int currentIndex = 0;
  PageController controllerPageViewer = PageController(initialPage: 0);
  AdminBoardBloc() : super(AdminBoardInitial()) {
    on<AdminBoardEvent>((event, emit) {
      switch (event) {
        case PageViewerScroll():
          {
            currentIndex = event.newIndex;
            emit(AdminBoardInitial());
          }
          break;
        case NavClickEvent():
          {
            currentIndex = event.newIndex;
            controllerPageViewer.animateToPage(
              event.newIndex,
              duration: const Duration(milliseconds: 250),
              curve: Curves.linear,
            );
            emit(AdminBoardInitial());
          }
          break;
      }
    });
  }
}
