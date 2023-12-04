// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/app_route.dart';
import '../../../../../one_product/presntation/view_model/one_product_bloc/one_product_bloc.dart';
import '../../../../data/models/products/products_list.dart';
import '../../../../data/rebos/home_rebo.dart';
import '../../../../data/rebos/rebos/home_remote_rebo.dart';

part 'milk_products_event.dart';
part 'milk_products_state.dart';

class MilkProductsBloc extends Bloc<MilkProductsEvent, MilkProductsState> {
  HomeRebo homeRebo = HomeRemoteRebo();

  late ProductsList milkProducts;
  MilkProductsBloc() : super(MilkProductsInitial()) {
    on<MilkProductsEvent>((event, emit) async {
      switch (event) {
        case MilkProductsInitEvent():
          {
            emit(MilkProductsLoading());
            try {
              milkProducts = ProductsList.fromList(
                data: await homeRebo.getMilkProducts(),
              );

              if (milkProducts.productsList.isEmpty) {
                emit(MilkProductsEmpty());
              } else {
                emit(MilkProductsSuccess());
              }
            } catch (e) {
              emit(MilkProductsFailed());
            }
          }
          break;
        case OneProdectSelect():
          {
            BlocProvider.of<OneProductBloc>(event.context).productModel =
                milkProducts.productsList[event.index];
            AppRoute.push(context: event.context, page: Pages.oneProduct);
          }
          break;
      }
    });
  }
}
