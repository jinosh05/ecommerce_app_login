import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app_login/constants/assets.dart';

void main() {
  test('assets assets test', () {
    expect(File(Assets.arrowRight).existsSync(), isTrue);
    expect(File(Assets.eyeClosed).existsSync(), isTrue);
    expect(File(Assets.eyeOpen).existsSync(), isTrue);
    expect(File(Assets.mail).existsSync(), isTrue);
    expect(File(Assets.passwordLock).existsSync(), isTrue);
  });
}
