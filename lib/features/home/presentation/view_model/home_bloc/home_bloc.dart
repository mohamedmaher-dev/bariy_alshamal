// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, unnecessary_import

import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final List<({int? type, String name})> categorys = [
    (type: 0, name: "نعيمي"),
    (type: 1, name: "منتجات الاغنام"),
    // (type: null, name: "تيس"),
    // (type: null, name: "نجدي"),
    // (type: null, name: "عجل"),
    // (type: null, name: "حاشي"),
  ];
  late int? categorySelect;

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      switch (event) {
        case CategorytSelect():
          {
            categorySelect = event.category;
            if (categorySelect != null) {
              AppRoute.push(context: event.context, page: Pages.products);
            }
          }
      }
    });
  }
}
