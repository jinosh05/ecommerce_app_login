import 'dart:io';

import 'package:flutter/services.dart';

mixin AppCloser {
  Future<void> closeApp() async {
    if (Platform.isAndroid) {
      await SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
