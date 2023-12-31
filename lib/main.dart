import 'package:bariy_alshamal/bariy_alshamal.dart';
import 'package:bariy_alshamal/core/utils/fcm_manger.dart';
import 'package:bariy_alshamal/core/utils/print.dart';
import 'package:bariy_alshamal/features/admin/add_product/presntation/view_model/add_product_bloc/add_product_bloc.dart';
import 'package:bariy_alshamal/features/admin/admin_board/view_model/admin_board_bloc/admin_board_bloc.dart';
import 'package:bariy_alshamal/features/admin/orders/presntation/view_model/orders/orders_bloc.dart';
import 'package:bariy_alshamal/features/admin/products/presntation/view_model/bloc/admin_products_bloc.dart';
import 'package:bariy_alshamal/features/admin/promo_code/presentation/view_model/bloc/promo_code_bloc.dart';
import 'package:bariy_alshamal/features/admin/users/presntation/view_model/users_bloc/users_bloc.dart';
import 'package:bariy_alshamal/features/auth/otb/presntation/view_model/otp_bloc/otp_bloc.dart';
import 'package:bariy_alshamal/features/auth/sign_in/presentation/view_model/sign_in_bloc/sign_in_bloc.dart';
import 'package:bariy_alshamal/features/auth/sign_up/presentaion/view_model/sign_up_bloc/sign_up_bloc.dart';
import 'package:bariy_alshamal/features/board/presentation/view_model.dart/board_bloc/board_bloc.dart';
import 'package:bariy_alshamal/features/cart/presntation/view_model/cart_bloc/cart_bloc.dart';
import 'package:bariy_alshamal/features/my_orders/presentation/view_model/my_orders_bloc/my_orders_bloc.dart';
import 'package:bariy_alshamal/features/one_product/presntation/view_model/one_product_bloc/one_product_bloc.dart';
import 'package:bariy_alshamal/features/products/presentation/view_model/products_bloc/products_bloc.dart';
import 'package:bariy_alshamal/features/splash/view_model/bloc/splash_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    DebugPrint.white(message.toMap().toString());
  } else {
    DebugPrint.error("Background FCM Not Working");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FCMManger.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(),
        ),
        BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(),
        ),
        BlocProvider<OtpBloc>(
          create: (context) => OtpBloc(),
        ),
        BlocProvider<AddProductBloc>(
          create: (context) => AddProductBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<OneProductBloc>(
          create: (context) => OneProductBloc(),
        ),
        BlocProvider<BoardBloc>(
          create: (context) => BoardBloc(),
        ),
        BlocProvider<AdminBoardBloc>(
          create: (context) => AdminBoardBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
        BlocProvider<SplashBloc>(
          create: (context) => SplashBloc(),
        ),
        BlocProvider<UsersBloc>(
          create: (context) => UsersBloc(),
        ),
        BlocProvider<OrdersBloc>(
          create: (context) => OrdersBloc(),
        ),
        BlocProvider<AdminProductsBloc>(
          create: (context) => AdminProductsBloc(),
        ),
        BlocProvider<MyOrdersBloc>(
          create: (context) => MyOrdersBloc(),
        ),
        BlocProvider<ProductsBloc>(
          create: (context) => ProductsBloc(),
        ),
        BlocProvider<PromoCodeBloc>(
          create: (context) => PromoCodeBloc(),
        ),
      ],
      child: const BariyAlshamal(),
    ),
  );
}
