import 'package:bariy_alshamal/features/board/presentation/view_model.dart/board_bloc/board_bloc.dart';
import 'package:bariy_alshamal/features/board/presentation/views/widgets/buttom_nav_bar_view.dart';
import 'package:bariy_alshamal/features/cart/presntation/views/cart_view.dart';
import 'package:bariy_alshamal/features/home/presentation/views/home_view.dart';
import 'package:bariy_alshamal/features/my_account/presentation/views/my_account_view.dart';
import 'package:bariy_alshamal/features/my_orders/presentation/views/my_order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardView extends StatefulWidget {
  const BoardView({super.key});

  @override
  State<BoardView> createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  @override
  void initState() {
    BlocProvider.of<BoardBloc>(context).currentIndex = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BoardBloc controller = BlocProvider.of<BoardBloc>(context);
    return Scaffold(
      bottomNavigationBar: const ButtomNavBarView(),
      body: BlocBuilder<BoardBloc, BoardState>(
        builder: (context, state) {
          return PageView(
            controller: controller.controllerPageViewer,
            onPageChanged: (value) {
              controller.add(PageViewerScroll(newIndex: value));
            },
            children: const [
              CartView(),
              HomeView(),
              MyOrdersView(),
              MyAccountView(),
            ],
          );
        },
      ),
    );
  }
}
