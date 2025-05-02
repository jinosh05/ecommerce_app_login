import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

/// [ThemeCubit] controls the Theme of whole app
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeLight());

  bool _isDark = false;

  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  /// Initiate this method to toggle theme
  void toggleTheme() {
    _isDark = !_isDark;
    if (_isDark) {
      emit(ThemeDark());
    } else {
      emit(ThemeLight());
    }
  }
}
