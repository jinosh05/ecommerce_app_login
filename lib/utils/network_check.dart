import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

///
/// [NetworkCheck] will check the Internet Availablity
///
class NetworkCheck {
  Future<bool> check() async {
    try {
      final response = await http.get(Uri.parse('https://www.google.com'));
      if (response.statusCode == 200) {
        return true;
      }
    } on SocketException catch (_) {
      log('Internet_not connected');
      return false;
    }
    return false;
  }
}
