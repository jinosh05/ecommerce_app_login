import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/configs/ui.dart';
import 'package:flutter/material.dart';

class App {
  App._();
  static bool? isLtr;
  static bool showAds = false;

  static void init(final BuildContext context) {
    UI.init(context);
    AppDimensions.init();

    Space.init();
    AppText.init();
    isLtr = Directionality.of(context) == TextDirection.ltr;
  }
}
