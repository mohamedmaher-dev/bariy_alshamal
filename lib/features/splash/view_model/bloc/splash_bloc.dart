// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, unnecessary_import

import 'package:bariy_alshamal/core/utils/app_manger.dart';
import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/features/splash/rebos/rebos/splash_remote_rebo.dart';
import 'package:bariy_alshamal/features/splash/rebos/splash_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashRebo splashRebo = SplashRemoteRebo();
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {
      switch (event) {
        case SplashInitEvent():
          {
            if (FirebaseAuth.instance.currentUser == null) {
              AppManger.isLogin = false;
            } else {
              AppManger.isLogin = true;
            }
            Future.delayed(
              const Duration(seconds: 2),
              () {
                AppRoute.pushAndRemoveUntil(
                    context: event.context, page: Pages.board);
              },
            );
          }
          break;
      }
    });
  }
}
