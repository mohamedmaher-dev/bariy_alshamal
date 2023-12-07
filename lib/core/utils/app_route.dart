import 'package:bariy_alshamal/features/admin/add_product/presntation/views/add_product_view.dart';
import 'package:bariy_alshamal/features/auth/otb/presntation/views/otp_view.dart';
import 'package:bariy_alshamal/features/auth/sign_in/presentation/views/sign_in_view.dart';
import 'package:bariy_alshamal/features/auth/sign_up/presentaion/views/sign_up_view.dart';
import 'package:bariy_alshamal/features/board/presentation/views/board_view.dart';
import 'package:bariy_alshamal/features/cart/presntation/views/cart_view.dart';
import 'package:bariy_alshamal/features/home/presentation/views/home_view.dart';
import 'package:bariy_alshamal/features/map/presntation/views/map_view.dart';
import 'package:bariy_alshamal/features/my_account/presentation/views/my_account_view.dart';
import 'package:bariy_alshamal/features/one_product/presntation/views/one_product_view.dart';
import 'package:bariy_alshamal/features/products/presentation/views/products_view.dart';
import 'package:bariy_alshamal/features/splash/views/splash_view.dart';
import 'package:flutter/material.dart';

import '../../features/admin/admin_board/views/admin_board_view.dart';

enum Pages {
  signUp,
  signIn,
  otp,
  addProduct,
  oneProduct,
  cart,
  home,
  account,
  map,
  splash,
  board,
  adminBoard,
  products,
}

abstract class AppRoute {
  static const Widget initialRoute = Text("Home Page");

  static MaterialPageRoute<dynamic> _materialPageRoute({
    required Pages page,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        switch (page) {
          case Pages.signUp:
            return const SignUpView();
          case Pages.signIn:
            return const SignInView();
          case Pages.otp:
            return const OtpView();
          case Pages.addProduct:
            return const AddProductView();
          case Pages.oneProduct:
            return const OneProductView();
          case Pages.cart:
            return const CartView();
          case Pages.home:
            return const HomeView();
          case Pages.account:
            return const MyAccountView();
          case Pages.map:
            return const MyMapView();
          case Pages.splash:
            return const SplashView();
          case Pages.board:
            return const BoardView();
          case Pages.adminBoard:
            return const AdminBoardView();
          case Pages.products:
            return const ProductsView();
        }
      },
    );
  }

  static pop({
    required BuildContext context,
  }) {
    Navigator.pop(context);
  }

  static push({
    required BuildContext context,
    required Pages page,
    Object? arguments,
  }) {
    Navigator.push(
      context,
      _materialPageRoute(page: page),
    );
  }

  static pushReplacement({
    required BuildContext context,
    required Pages page,
    Object? arguments,
  }) {
    Navigator.pushReplacement(
      context,
      _materialPageRoute(page: page),
    );
  }

  static pushAndRemoveUntil({
    required BuildContext context,
    required Pages page,
    Object? arguments,
  }) {
    Navigator.pushAndRemoveUntil(
      context,
      _materialPageRoute(page: page),
      (route) => false,
    );
  }
}
