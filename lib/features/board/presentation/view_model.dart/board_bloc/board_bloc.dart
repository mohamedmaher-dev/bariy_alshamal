// ignore_for_file: depend_on_referenced_packages, unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'board_event.dart';
part 'board_state.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  int currentIndex = 1;
  PageController controllerPageViewer = PageController(initialPage: 1);
  BoardBloc() : super(BoardInitial()) {
    on<BoardEvent>(
      (event, emit) {
        switch (event) {
          case PageViewerScroll():
            {
              currentIndex = event.newIndex;
              emit(BoardInitial());
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
              emit(BoardInitial());
            }
            break;
        }
      },
    );
  }
}
