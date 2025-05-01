class AppException implements Exception {
  AppException([this._message, this._prefix]);
  final String? _message;
  final String? _prefix;
  @override
  String toString() => '$_prefix$_message';
}

class FetchDataException extends AppException {
  FetchDataException([final String? message]) : super(message, '');
}

class BadRequestException extends AppException {
  BadRequestException([final message]) : super(message, 'Invalid Request: ');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([final message]) : super(message, 'Unauthorised: ');
}

class InvalidInputException extends AppException {
  InvalidInputException([final String? message])
      : super(message, 'Invalid Input: ');
}

class ServerNotFoundException extends AppException {
  ServerNotFoundException([final message]) : super(message, 'Server Not Found');
}
