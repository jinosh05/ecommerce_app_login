import 'dart:io';

import 'package:ecommerce_app_login/constants/assets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('assets assets test', () {
    expect(File(Assets.placeholder).existsSync(), isTrue);
    expect(File(Assets.arrowRight).existsSync(), isTrue);
    expect(File(Assets.editAvatar).existsSync(), isTrue);
    expect(File(Assets.eyeClosed).existsSync(), isTrue);
    expect(File(Assets.eyeOpen).existsSync(), isTrue);
    expect(File(Assets.home).existsSync(), isTrue);
    expect(File(Assets.mail).existsSync(), isTrue);
    expect(File(Assets.messageIcon).existsSync(), isTrue);
    expect(File(Assets.passwordLock).existsSync(), isTrue);
    expect(File(Assets.profileIcon).existsSync(), isTrue);
  });
}
