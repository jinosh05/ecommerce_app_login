import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();
  static Future<dynamic> push(
    final BuildContext context,
    final Widget page,
  ) async => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (final context) => page));

  static Future<void> replace(
    final BuildContext context,
    final Widget page,
  ) async {
    await Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder:
            (final context, final animation, final secondaryAnimation) => page,
        transitionsBuilder: (
          final context,
          final animation,
          final secondaryAnimation,
          final child,
        ) {
          const begin = Offset(1, 0); // Start from the right (1.0)
          const end = Offset.zero; // End at the current position (0.0)
          const curve = Curves.ease;

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  static Future<void> makeFirst(
    final BuildContext context,
    final Widget page,
  ) async {
    Navigator.of(context).popUntil((final predicate) => predicate.isFirst);
    await Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (final context) => page));
  }

  static void pop(final BuildContext context) {
    Navigator.of(context).pop();
  }

  static void dismissAlert(final BuildContext context) {
    Navigator.of(context).pop();
  }

  static Future<void> pushAndRemove(
    final BuildContext context,
    final Widget page,
  ) async {
    await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (final context) => page),
      (final route) => false,
    );
  }

  static Future<void> replaceLeftSwipe(
    final BuildContext context,
    final Widget page,
  ) async {
    await Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder:
            (final context, final animation, final secondaryAnimation) => page,
        transitionsBuilder: (
          final context,
          final animation,
          final secondaryAnimation,
          final child,
        ) {
          const begin = Offset(-1, 0); // Start from the left (-1.0)
          const end = Offset.zero; // End at the current position (0.0)
          const curve = Curves.ease;

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }
}
