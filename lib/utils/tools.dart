import 'dart:ui' as ui;

import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class Tools {
  static void showSnack(final String message) {
    ScaffoldMessenger.of(
      navigatorKey.currentContext!,
    ).showSnackBar(SnackBar(content: Text(message, style: AppText.b3!.w(6))));
  }

  Future<Uint8List?> pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true,
        withReadStream: true,
      );

      if (result != null) {
        final files = result.files;
        if (files.isNotEmpty) {
          return await compressImage(files.first.bytes!);
        }
      }
    } on PlatformException catch (e) {
      // ignore: use_build_context_synchronously

      showSnack(e.message ?? S.allowPermission);
      Future.delayed(const Duration(seconds: 2), () async {
        await openAppSettings();
      });
      return null;
    }
    return null;
  }

  static Future<Uint8List> compressImage(final Uint8List data) async {
    final image = await ui.instantiateImageCodec(data);
    final frame = await image.getNextFrame();
    final img = frame.image;

    final compressed = await FlutterImageCompress.compressWithList(
      data,
      minHeight: adjustTo600(img.height),
      minWidth: adjustTo600(img.width),
      format: CompressFormat.png,
    );

    return compressed;
  }

  static int adjustTo600(final int value) {
    const target = 600;
    return value > target ? target : value;
  }

  Future<void> sendEmail({required final String toEmail}) async {
    final emailLaunchUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      queryParameters: {'subject': 'Hello', 'body': 'Greetings from Jinosh'},
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw Exception('Could not launch email!');
    }
  }
}
