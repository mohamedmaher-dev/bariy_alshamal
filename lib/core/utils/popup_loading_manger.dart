import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class PopUpLoading {
  static loading() {
    EasyLoading.show(
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
      indicator: const CircularProgressIndicator(
        strokeWidth: 2,
      ),
    );
  }

  static dismiss() {
    EasyLoading.dismiss();
  }

  static error(String error) {
    EasyLoading.showError(error);
  }

  static success(String error) {
    EasyLoading.showSuccess(error);
  }
}
