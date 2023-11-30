import 'package:bariy_alshamal/core/widgets/admin_buttom_nav_bar_view.dart';
import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:flutter/material.dart';
import 'widgets/admin_product_item.dart';

class AdminProductsView extends StatelessWidget {
  const AdminProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(title: "المنتجات"),
      bottomNavigationBar: const AdminButtomNavBarView(),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => const AdminProductItem(),
      ),
    );
  }
}
