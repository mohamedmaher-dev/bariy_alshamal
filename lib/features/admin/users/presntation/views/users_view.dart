import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/core/widgets/empty_view.dart';
import 'package:bariy_alshamal/features/admin/users/presntation/view_model/users_bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/user_item.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  late UsersBloc controller;
  @override
  void initState() {
    controller = BlocProvider.of<UsersBloc>(context);
    controller.add(UsersInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(title: "العملاء"),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          switch (state) {
            case UsersInitial():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case UsersLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case UsersSuccess():
              return ListView.builder(
                padding: EdgeInsets.all(10.w),
                itemCount: controller.users.list.length,
                itemBuilder: (context, index) => UserItem(
                  controller: controller,
                  index: index,
                ),
              );
            case UsersFailed():
              return const Center(
                child: Icon(Icons.error),
              );
            case UsersEmpty():
              return const EmptyViwe();
          }
        },
      ),
    );
  }
}
