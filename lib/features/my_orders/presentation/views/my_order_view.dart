import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/core/widgets/empty_view.dart';
import 'package:bariy_alshamal/features/my_orders/presentation/view_model/my_orders_bloc/my_orders_bloc.dart';
import 'package:bariy_alshamal/features/my_orders/presentation/views/widgets/my_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/text_styles.dart';
import '../../../../core/utils/app_route.dart';

class MyOrdersView extends StatefulWidget {
  const MyOrdersView({super.key});

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  late MyOrdersBloc controller;
  @override
  void initState() {
    controller = BlocProvider.of<MyOrdersBloc>(context);
    controller.add(MyOrdersInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(title: "طلباتي"),
      body: BlocBuilder<MyOrdersBloc, MyOrdersState>(
        builder: (context, state) {
          switch (state) {
            case MyOrdersInitial():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case MyOrdersLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case MyOrdersSeccess():
              return ListView.builder(
                itemCount: controller.orders.list.length,
                itemBuilder: (context, index) => MyOrderItem(
                  index: index,
                  controller: controller,
                  date: controller.orders.list[index].date,
                  discount: controller.orders.list[index].discount,
                  count: controller.orders.list[index].productsCount.toString(),
                  price: controller.orders.list[index].orderPrice.toString(),
                  productName: controller.orders.list[index].orderID,
                  status: controller.orders.list[index].status,
                ),
              );
            case MyOrdersFailed():
              return const Center(
                child: Icon(Icons.error),
              );
            case MyOrdersEmpty():
              return const EmptyViwe();
            case MyOrdersNeedLoging():
              return Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    AppRoute.push(context: context, page: Pages.signIn);
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
