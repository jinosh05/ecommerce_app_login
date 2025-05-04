import 'package:ecommerce_app_login/env.dart';

///
/// Store all [Uri] base here
///
class Endpoints {
  Endpoints._();

  // base url
  // static const String _baseUrl = Env.baseUrl;

  static const String _nbaseUrl = Env.baseUrl;

  // receiveTimeout
  // static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 15;

  static const String photos = "https://jsonplaceholder.typicode.com/photos";
}
