import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/core/widgets/empty_view.dart';
import 'package:bariy_alshamal/features/products/presentation/view_model/products_bloc/products_bloc.dart';
import 'package:bariy_alshamal/features/products/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  void initState() {
    controller = BlocProvider.of<ProductsBloc>(context);
    controller.add(ProductsInitEvent(context: context));
    super.initState();
  }

  late ProductsBloc controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(title: "المنتجات"),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          switch (state) {
            case ProductsInitial():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ProductsLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ProductsSeccess():
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ProductItem(
                  controller: controller,
                  productModel: controller.products.list[index],
                ),
                itemCount: controller.products.list.length,
              );
            case ProductsdFailed():
              return const Center(
                child: Icon(Icons.error),
              );
            case ProductsEmpty():
              return const EmptyViwe(
                arText: "لا يوجد منتجات في هذا القسم الأن",
                enText: "No Products In This Category Now",
              );
          }
        },
      ),
    );
  }
}
