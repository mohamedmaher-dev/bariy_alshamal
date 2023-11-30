import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/features/cart/presntation/views/widgets/cart_buttom_body.dart';
import 'package:flutter/material.dart';
import 'widgets/cart_item.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(title: "السلة"),
      bottomNavigationBar: const CartButtomBody(),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => const CartItem(),
      ),
    );
  }
}
