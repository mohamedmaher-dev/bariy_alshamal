import 'package:bariy_alshamal/core/widgets/admin_buttom_nav_bar_view.dart';
import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/user_item.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(title: "العملاء"),
      bottomNavigationBar: const AdminButtomNavBarView(),
      body: ListView.builder(
        padding: EdgeInsets.all(10.w),
        itemCount: 3,
        itemBuilder: (context, index) => const UserItem(),
      ),
    );
  }
}
