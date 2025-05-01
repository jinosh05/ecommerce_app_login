part of 'resources.dart';

class AppColors {
  static const Color primary = pastelGreen;

  static const Color blackBean = Color(0xFF08150E); // Black Bean

  static const Color blackOlive = Color(0xFF0A1B12); // Black Olive

  static const Color paleAqua = Color(0xFFEDFBF3);

  static const Color darkGray = Color(0xff666666);

  static const Color lavenderBlush = Color(0xffFFF8F8);

  static const Color oceanGreen = Color(0xff46BC7D);

  static const Color mossGreen = Color(0xFF2A724C);

  static const Color honeydew = Color(0xFFE7F6EE);

  static const Color darkForestGreen = Color(0xff05572A);

  static const Color mediumAquamarine = Color(0xff4CCD88);

  static const Color harvestGold = Color(0xffAD8100);

  static const Color dustyPink = Color(0xffCDBFBF);

  static const Color davyGray = Color(0xff525252);

  static const Color eerieBlack = Color(0xff272727);

  static const Color sageGreen = Color(0xffA2BCAD);

  static const Color gold = Color(0xffDEA500);

  static const Color bronze = Color(0xff6B5000);

  static const Color seaGreen = Color(0xff36915E);

  static const Color deepEvergreen = Color(0xFF102B1C);

  static const Color richBlackGreen = Color(0xff08150e);

  static const Color dimGray = Color(0xff505050);

  static const Color lightGray = Color(0xffF2F2F2);

  static const Color mintGreen = Color(0xff93DCB5);

  static const Color darkGreen2 = Color(0xff293E33);

  static const Color cyberYellow = Color(0xffFFD500);

  ///
  /// New Colors
  ///
  static const Color darkSlateGray = Color(0xff263238);

  static const Color almostWhite = Color(0xffF4F7F9);

  static const Color paleBlueGray = Color(0xffDFE5ED);

  static const Color steelGray = Color(0xff6D737C);

  static const Color grayishBlue = Color(0xff2D3647);

  static const Color pastelGreen = Color(0xff6DDEA2);

  static const Color forestGreen = Color(0xff4F7661);

  static const Color graniteGray = Color(0xff6F6F6F);

  static const Color lightGrey = Color(0xffD0D0D0);

  static const Color limeGreen = Color(0xff304035);

  static const Color steelTeal = Color(0xff5BE79E);

  static const Color darkGray2 = Color(0xff383333);

  static const Color mercury = Color(0xffEBEBEB);

  static const Color lightGray2 = Color(0xffD9D9D9);

  static const Color neutralGray = Color(0xff6E6C6C);

  static const Color silver = Color(0xffBBBBBB);

  static const Color spanishGrey = Color(0xff989898);

  static const Color charcoal = Color(0xff313131);

  static const Color darkIndigo = Color(0xff26273A);

  static const Color gasGreen = Color(0xff00FF94);

  static const Color moderateGreen = Color(0xff5DC486);

  static const Color rosePink = Color(0xffF5BFC1);

  static const Color red = Color(0xffFF686D);

  static const Color lightPink = Color(0xffFFE8E8);

  static const Color lightPink2 = Color(0xffFFAAAC);

  static const Color darkGreen = Color(0xFF205639); // Dark Green

  static const Color lightOrange = Color(0xffFFB08D);

  static const Color darkRust = Color(0xffBD4C25);

  static const Color graniteGrayLite = Color(0xff656565);

  static const Color palladium = Color(0xffB1B1B1);

  static const Color atlantis = Color(0xff74DE3F);

  static const Color blueGreen = Color(0xff1D7874);

  static const Color softMint = Color(0xffF0FAF4);

  static const Color nero = Color(0xff1E1E1E);

  static const Color darkTeal = Color(0xff57826B);

  static const Color vividGreen = Color(0xff09BA15);

  static const Color darkRed = Color(0xffFF5F52);

  static const Color blue = Color(0xFF00A0FF);

  static const Color paleGreen = Color(0xFFA0D9BD);

  static const Color charcoalGray = Color(0xff4E4E4E);

  static const Color nearBlack = Color(0xff171717);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);
}

extension ColorExtensions on Color {
  Color adjustOpacity(final double opacity) => withValues(alpha: opacity);
}
