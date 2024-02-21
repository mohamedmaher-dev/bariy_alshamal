import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/features/admin/admin_board/views/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            ListTile(
              title: Text(
                "القائمة",
                style: TextStyle(
                  fontSize: 25.sp,
                  color: ColorsManger.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(Icons.menu),
            ),
            const DrawerItem(
              title: "اضافة منتج",
              index: 0,
              icon: Icons.add,
            ),
            const DrawerItem(
              title: "المنتجات",
              index: 1,
              icon: Icons.grid_view_rounded,
            ),
            const DrawerItem(
              icon: Icons.delivery_dining,
              title: "الطلبات",
              index: 2,
            ),
            const DrawerItem(
              icon: Icons.group,
              title: "العملاء",
              index: 3,
            ),
            const DrawerItem(
              icon: Icons.discount,
              title: "اكواد الخصم",
              index: 4,
            ),
            const DrawerItem(
              icon: Icons.auto_awesome_motion_rounded,
              title: "سلايدر",
              index: 5,
            ),
          ],
        ),
      ),
    );
  }
}
