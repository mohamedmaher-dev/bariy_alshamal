import 'package:bariy_alshamal/features/admin/add_product/presntation/views/add_product_view.dart';
import 'package:bariy_alshamal/features/admin/orders/presntation/views/orders_view.dart';
import 'package:bariy_alshamal/features/admin/products/presntation/views/admin_products_view.dart';
import 'package:bariy_alshamal/features/admin/users/presntation/views/users_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/admin_board_bloc/admin_board_bloc.dart';
import 'admin_buttom_nav_bar_view.dart';

class AdminBoardView extends StatefulWidget {
  const AdminBoardView({super.key});

  @override
  State<AdminBoardView> createState() => _AdminBoardViewState();
}

class _AdminBoardViewState extends State<AdminBoardView> {
  @override
  void initState() {
    BlocProvider.of<AdminBoardBloc>(context).currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AdminBoardBloc controller = BlocProvider.of<AdminBoardBloc>(context);
    return Scaffold(
      bottomNavigationBar: const AdminButtomNavBarView(),
      body: BlocBuilder<AdminBoardBloc, AdminBoardState>(
        builder: (context, state) {
          return PageView(
            controller: controller.controllerPageViewer,
            onPageChanged: (value) {
              controller.add(PageViewerScroll(newIndex: value));
            },
            children: const [
              AddProductView(),
              AdminProductsView(),
              OrdersView(),
              UsersView(),
            ],
          );
        },
      ),
    );
  }
}
