// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, unnecessary_import

import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/features/home/data/rebos/home_rebo.dart';
import 'package:bariy_alshamal/features/home/data/rebos/rebos/home_remote_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../one_product/presntation/view_model/one_product_bloc/one_product_bloc.dart';
import '../../../../data/models/products/products_list.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRebo homeRebo = HomeRemoteRebo();
  late ProductsList products;
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      switch (event) {
        case HomeInitEvent():
          {
            emit(HomeLoading());
            try {
              products = ProductsList.fromList(
                data: await homeRebo.getProducts(),
              );

              if (products.productsList.isEmpty) {
                emit(HomeEmpty());
              } else {
                emit(HomeSuccess());
              }
            } catch (e) {
              emit(HomeFailed());
            }
          }
          break;
        case OneProdectSelect():
          {
            BlocProvider.of<OneProductBloc>(event.context).productModel =
                products.productsList[event.index];
            AppRoute.push(context: event.context, page: Pages.oneProduct);
          }
      }
    });
  }
}
