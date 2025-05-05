import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/data/constant/endpoints.dart';
import 'package:ecommerce_app_login/data/exception/app_exception.dart';
import 'package:ecommerce_app_login/utils/network_check.dart';
import 'package:ecommerce_app_login/utils/tools.dart';
import 'package:http/http.dart' as http;

///
/// An API response handling class for handling the
/// [get],[post] methods and [Exception] handling
/// and also return the [http.Response]
///
class ApiClient {
  ///
  /// Delete:------------------------------------------------------------------
  ///
  Future<dynamic> delete(
    final String uri, {
    final Map<String, dynamic>? data,
    final Map<String, String>? headers,
  }) async {
    if (!await NetworkCheck().check()) {
      Tools.showSnack(S.noInternetMsg);
      return null;
    }
    final header = <String, String>{'accept': 'application/json'};
    if (headers != null) {
      header.addAll(headers);
    }
    try {
      // debugPrint("Working $data using header $header");

      final response = await http
          .delete(Uri.parse(uri), headers: header, body: data)
          .timeout(
            const Duration(seconds: Endpoints.connectionTimeout),
            onTimeout: () {
              throw TimeoutException('Connection Timeout');
            },
          );

      log(response.body);

      return _returnResponse(response, uri);
    } catch (e) {
      Tools.showSnack(e.toString());
      return S.noInternetMsg;
    }
  }

  ///
  /// Get:---------------------------------------------------------------------
  ///
  Future<dynamic> get(
    final String uri, {
    final Map<String, String>? headers,
  }) async {
    if (!await NetworkCheck().check()) {
      Tools.showSnack(S.noInternetMsg);
      return null;
    }
    final header = <String, String>{
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    if (headers != null) {
      header.addAll(headers);
    }
    try {
      final response = await http
          .get(Uri.parse(uri), headers: header)
          .timeout(
            const Duration(seconds: Endpoints.connectionTimeout),
            onTimeout: () {
              throw TimeoutException('Connection Timeout');
            },
          );

      // log(response.body);

      return _returnResponse(response, uri);
    } catch (e) {
      Tools.showSnack(e.toString());
      return S.noInternetMsg;
    }
  }

  ///
  /// Post:--------------------------------------------------------------------
  ///
  Future<dynamic> post(
    final String uri, {
    final Map<String, dynamic>? data,
    final Map<String, String>? headers,
    final int? timeout,
  }) async {
    if (!await NetworkCheck().check()) {
      Tools.showSnack(S.noInternetMsg);
      return null;
    }
    final header = <String, String>{
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    if (headers != null) {
      header.addAll(headers);
    }
    try {
      // debugPrint('URL : $uri');
      // debugPrint('Working $data using header $header');
      final response = await http
          .post(Uri.parse(uri), headers: header, body: jsonEncode(data))
          .timeout(
            Duration(seconds: timeout ?? Endpoints.connectionTimeout),
            onTimeout: () {
              throw TimeoutException('Connection Timeout');
            },
          );

      // log(response.body);

      return _returnResponse(response, uri);
    } catch (e) {
      Tools.showSnack(e.toString());
      return S.noInternetMsg;
    }
  }

  dynamic _returnResponse(final http.Response response, final String url) {
    try {
      final map = jsonDecode(response.body);
      if (map is Map && map.containsKey('details')) {
        Tools.showSnack(map['message'].toString());
      } else {
        switch (response.statusCode) {
          case 200:
            final responseJson = response.body;
            return responseJson;
          case 201:
            final responseJson = response.body;
            return responseJson;
          case 400:
            throw BadRequestException(response.body);
          case 401:
            throw UnauthorisedException(response.body);
          case 403:
            throw UnauthorisedException(response.body);
          case 500:
            throw ServerNotFoundException(response.body);
          default:
            throw FetchDataException(
              '''
  Error occured while Communication with Server with StatusCode : ${response.statusCode}''',
            );
        }
      }
    } catch (e) {
      return e;
    }
  }
}
