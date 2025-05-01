import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData theme = ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Colors.white,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    scrollbarTheme: const ScrollbarThemeData(
      thumbColor: WidgetStatePropertyAll(AppColors.primary),
      trackColor: WidgetStatePropertyAll(AppColors.primary),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    cardColor: AppColors.almostWhite,
    cardTheme: const CardTheme(
      color: AppColors.almostWhite,
      surfaceTintColor: AppColors.almostWhite,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      isDense: true,
      hintStyle: TextStyle(
        fontFamily: 'Poppins',
        // color: Colors.white,
        fontSize: 16,
      ),
    ),
  );
}
