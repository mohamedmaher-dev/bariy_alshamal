import 'package:bariy_alshamal/core/widgets/admin_buttom_nav_bar_view.dart';
import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/order_item.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(title: "طلباتي"),
      bottomNavigationBar: const AdminButtomNavBarView(),
      body: ListView.separated(
        padding: EdgeInsets.all(10.w),
        itemCount: 2,
        itemBuilder: (context, index) => const OrderItem(),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
