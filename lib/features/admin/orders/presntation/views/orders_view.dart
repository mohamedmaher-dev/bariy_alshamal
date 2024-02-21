import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/core/widgets/empty_view.dart';
import 'package:bariy_alshamal/features/admin/orders/presntation/view_model/orders/orders_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../admin_board/views/widgets/admin_drawer.dart';
import 'widgets/order_item.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  @override
  void initState() {
    controller = BlocProvider.of<OrdersBloc>(context);
    controller.add(OrdersInitEvent());
    super.initState();
  }

  late OrdersBloc controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AdminDrawer(),
      appBar: const AppBarView(title: "طلباتي"),
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          switch (state) {
            case OrdersInitial():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case OrdersLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case OrdersSuccess():
              return ListView.separated(
                padding: EdgeInsets.all(10.w),
                itemCount: controller.orders.list.length,
                itemBuilder: (context, index) => OrderItem(
                  controller: controller,
                  orderModel: controller.orders.list[index],
                ),
                separatorBuilder: (context, index) => const Divider(),
              );
            case OrdersFailed():
              return const Center(
                child: Icon(Icons.error),
              );
            case OrdersEmpty():
              return const EmptyViwe(arText: "", enText: "");
          }
        },
      ),
    );
  }
}

class BottomAppBar extends StatelessWidget {
  const BottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      color: ColorsManger.white,
      child: CupertinoSlidingSegmentedControl(
        children: const {
          0: Text("data"),
          1: Text("data"),
        },
        onValueChanged: (value) {},
      ),
    );
  }
}
