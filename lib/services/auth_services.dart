import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

///
/// [AuthService] is a class used to Store & Retrieve [SharedPreferences] datas
///  1) Declare the key for [SharedPreferences]
///  2) use get Method to fetch Stored datas
///  3) use the set Method to Store Datas
///
class AuthService {
  ///
  ///   KEYS OF SHARED PREFERENCE
  ///

  final String _isLoggedIn = 'is_logged_in';

  final String _email = 'email';

  //
  //    INSTANCE OF SHARED PREFERENCE
  //
  Future<SharedPreferences> instance() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<String> getEmail() async {
    final prefs = await instance();
    return prefs.getString(_email) ?? '';
  }

  ///
  ///     GETTERS
  ///

  Future<bool> isLoggedIn() async {
    final prefs = await instance();
    return prefs.getBool(_isLoggedIn) ?? false;
  }

  ///
  ///     SETTERS
  ///
  Future<void> setLoggedIn() async {
    final prefs = await instance();
    await prefs.setBool(_isLoggedIn, true);
  }

  Future<void> setEmail(final String email) async {
    final prefs = await instance();
    await prefs.setString(_email, email);
  }

  Future<void> resetAll() async {
    final prefs = await instance();
    await prefs.clear();
  }
}
