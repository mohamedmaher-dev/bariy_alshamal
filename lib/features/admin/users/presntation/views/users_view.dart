import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/core/widgets/empty_view.dart';
import 'package:bariy_alshamal/features/admin/users/presntation/view_model/users_bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../admin_board/views/widgets/admin_drawer.dart';
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
      drawer: const AdminDrawer(),
      appBar: AppBarView(
        title: "العملاء",
        actions: [
          IconButton(
            icon: const Icon(Icons.notification_add, color: ColorsManger.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (contextDialog) => AlertDialog(
                  title: const Text("ارسال اشعار"),
                  content: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        TextFormField(
                          controller: controller.notifiTitle,
                          decoration: const InputDecoration(
                            hintText: "العنوان",
                            filled: true,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        TextFormField(
                          controller: controller.notifiBody,
                          decoration: const InputDecoration(
                            hintText: "الوصف",
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        AppRoute.pop(context: contextDialog);
                        controller.add(SendNotifi());
                      },
                      child: const Text("ارسال"),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
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
              return const EmptyViwe(arText: "", enText: "");
          }
        },
      ),
    );
  }
}
