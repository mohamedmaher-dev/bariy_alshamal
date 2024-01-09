import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/core/widgets/empty_view.dart';
import 'package:bariy_alshamal/features/admin/products/presntation/view_model/bloc/admin_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/admin_product_item.dart';

class AdminProductsView extends StatefulWidget {
  const AdminProductsView({super.key});

  @override
  State<AdminProductsView> createState() => _AdminProductsViewState();
}

class _AdminProductsViewState extends State<AdminProductsView> {
  late AdminProductsBloc controller;
  @override
  void initState() {
    controller = BlocProvider.of<AdminProductsBloc>(context);
    controller.add(AdminProductsInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(title: "المنتجات"),
      body: BlocBuilder<AdminProductsBloc, AdminProductsState>(
        builder: (context, state) {
          switch (state) {
            case AdminProductsInitial():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case AdminProductsLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case AdminProductsSuccess():
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => AdminProductItem(
                  index: index,
                  controller: controller,
                ),
                itemCount: controller.products.list.length,
              );
            case AdminProductsEmpty():
              return const EmptyViwe(arText: "", enText: "");
            case AdminProductsFailed():
              return const Center(
                child: Icon(Icons.error),
              );
          }
        },
      ),
    );
  }
}
