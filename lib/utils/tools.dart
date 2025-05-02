import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/main.dart';
import 'package:flutter/material.dart';

class Tools {
  static void showSnack(String message) {
    ScaffoldMessenger.of(
      navigatorKey.currentContext!,
    ).showSnackBar(SnackBar(content: Text(message, style: AppText.b3!.w(6))));
  }
}
