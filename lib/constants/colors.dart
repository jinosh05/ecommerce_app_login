part of 'resources.dart';

class AppColors {
  static const Color primary = Color.fromRGBO(218, 94, 66, 1);

  static const Color grey900 = Color(0xff191C1E);

  static const Color grey500 = Color(0xff757779);

  static const Color grey700 = Color(0xff444749);

  static const Color grayishBlue = Color(0xff45464E);

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
