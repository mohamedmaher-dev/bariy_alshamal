import 'package:bariy_alshamal/features/admin/admin_board/view_model/admin_board_bloc/admin_board_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.index,
    required this.icon,
  });
  final String title;
  final int index;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    AdminBoardBloc controller = BlocProvider.of<AdminBoardBloc>(context);
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      selected: controller.currentIndex == index,
      onTap: () {
        controller.add(NavClickEvent(newIndex: index));
        Navigator.of(context).pop();
      },
    );
  }
}
