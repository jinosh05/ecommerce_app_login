import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  AppText._();
  static TextStyle? btn;

  // Headings
  static TextStyle? h1;
  static TextStyle? h1b;
  static TextStyle? h2;
  static TextStyle? h2b;
  static TextStyle? h3;
  static TextStyle? h3b;
  static TextStyle? h4;
  static TextStyle? h4b;

  // Body
  static TextStyle? b1;
  static TextStyle? b1b;
  static TextStyle? b2;
  static TextStyle? b2b;
  static TextStyle? b3;
  static TextStyle? b3b;

  // Label
  static TextStyle? l1;
  static TextStyle? l1b;
  static TextStyle? l2;
  static TextStyle? l2b;

  static void init() {
    const b = FontWeight.bold;

    final baseStyle = GoogleFonts.getFont('Inter');

    h1 = baseStyle.copyWith(fontSize: AppDimensions.font(22));
    h1b = h1!.copyWith(fontWeight: b);

    h2 = baseStyle.copyWith(fontSize: AppDimensions.font(18));
    h2b = h2!.copyWith(fontWeight: b);

    h3 = baseStyle.copyWith(fontSize: AppDimensions.font(15));
    h3b = h3!.copyWith(fontWeight: b);

    h4 = baseStyle.copyWith(fontSize: AppDimensions.font(12));
    h4b = h4!.copyWith(fontWeight: b);

    b1 = baseStyle.copyWith(fontSize: AppDimensions.font(10));
    b1b = b1!.copyWith(fontWeight: b);

    b2 = baseStyle.copyWith(fontSize: AppDimensions.font(8));
    b2b = b2!.copyWith(fontWeight: b);

    b3 = baseStyle.copyWith(fontSize: AppDimensions.font(7));
    b3b = b3!.copyWith(fontWeight: b);

    l1 = baseStyle.copyWith(fontSize: AppDimensions.font(6));
    l1b = l1!.copyWith(fontWeight: b);

    l2 = baseStyle.copyWith(fontSize: AppDimensions.font(4));
    l2b = l2!.copyWith(fontWeight: b);
  }
}

extension SuperTextStyles on TextStyle {
  TextStyle cl(final Color color) => copyWith(color: color);

  TextStyle ita() => copyWith(fontStyle: FontStyle.italic);

  TextStyle s([final double? size]) => copyWith(fontSize: size ?? fontSize);

  TextStyle tsc([final double multiplier = 1.0]) =>
      copyWith(fontSize: fontSize! * multiplier);

  TextStyle w(final int i) {
    var w = FontWeight.w400;

    if (i == 3) {
      w = FontWeight.w300;
    }
    if (i == 4) {
      w = FontWeight.w400;
    }
    if (i == 5) {
      w = FontWeight.w500;
    }
    if (i == 6) {
      w = FontWeight.w600;
    }
    if (i == 7) {
      w = FontWeight.w700;
    }
    if (i == 8) {
      w = FontWeight.w800;
    }
    if (i == 9) {
      w = FontWeight.w900;
    }
    return copyWith(fontWeight: w);
  }
}

/// Additional TextStyle Extensions can be added here
extension CustomTextStyles on TextStyle {
  TextStyle priClr() => copyWith(color: AppColors.primary);

  TextStyle pop() => copyWith(fontFamily: 'Poppins');

  TextStyle inter() => copyWith(fontFamily: 'Inter');

  TextStyle montserrat() => copyWith(fontFamily: 'Montserrat');

  TextStyle notoSans() => copyWith(fontFamily: 'Noto Sans');
}
