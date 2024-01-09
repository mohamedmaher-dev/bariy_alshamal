import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:bariy_alshamal/core/utils/app_manger.dart';
import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/core/widgets/empty_view.dart';
import 'package:bariy_alshamal/features/cart/presntation/view_model/cart_bloc/cart_bloc.dart';
import 'package:bariy_alshamal/features/cart/presntation/views/widgets/cart_buttom_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/cart_item.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late CartBloc controller;
  @override
  void initState() {
    controller = BlocProvider.of<CartBloc>(context);
    controller.add(CartInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(
        title: "السلة",
        actions: [
          if (AppManger.isLogin)
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("استخدام كود خصم"),
                    content: TextFormField(
                      decoration: const InputDecoration(hintText: "كود الخصم"),
                      controller: controller.promoCodeController,
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          AppRoute.pop(context: context);
                          controller.add(UsePromoCode());
                        },
                        child: const Text("تأكيد"),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(
                Icons.discount_rounded,
                color: ColorsManger.white,
              ),
            ),
          if (AppManger.isLogin)
            IconButton(
              onPressed: () {
                AppRoute.push(context: context, page: Pages.map);
              },
              icon: const Icon(
                Icons.location_pin,
                color: ColorsManger.white,
              ),
            ),
        ],
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartSuccess) {
            return CartButtomBody(controller: controller);
          } else {
            return const SizedBox();
          }
        },
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          switch (state) {
            case CartInitial():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case CartLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case CartSuccess():
              return ListView.builder(
                itemCount: controller.cartItems.list.length,
                itemBuilder: (context, index) => CartItem(
                  controller: controller,
                  index: index,
                ),
              );
            case CartFailed():
              return const Center(
                child: Icon(Icons.error),
              );
            case CartEmpty():
              return const EmptyViwe(
                arText: "لا يوجد منتجات في السلة",
                enText: "No Items In Cart",
              );
            case CartNeedLogin():
              return Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    controller.add(GoToLogin(context: context));
                  },
                  icon: const Icon(Icons.add),
                  label: Text(
                    "يجب تسجيل الدخول",
                    style: TextStyles.tsP15B,
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
