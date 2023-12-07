import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:bariy_alshamal/features/products/data/models/product_model.dart';
import 'package:bariy_alshamal/features/products/data/rebo/products_rebo.dart';
import 'package:bariy_alshamal/features/products/data/rebo/rebos/products_remote_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/print.dart';
import '../../../data/models/products_list_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRebo _rebo = ProductsRemoteRebo();
  late ProductsListModel products;
  late ProductModel oneProductModel;
  late int? productType;
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      switch (event) {
        case ProductsInitEvent():
          {
            productType =
                BlocProvider.of<HomeBloc>(event.context).categorySelect;
            emit(ProductsInitial());
            try {
              products = ProductsListModel.fromList(
                data: await _rebo.getProducts(productType: productType!),
              );
              if (products.list.isEmpty) {
                emit(ProductsEmpty());
              } else {
                emit(ProductsSeccess());
              }
            } catch (e) {
              DebugPrint.error(e.toString());
              emit(ProductsdFailed());
            }
          }
          break;
        case ProductClickEvent():
          {
            oneProductModel = event.productModel;
            AppRoute.push(context: event.context, page: Pages.oneProduct);
          }
      }
    });
  }
}
