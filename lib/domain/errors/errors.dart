abstract class Failure implements Exception {
  String? get message;
}

class ConnectionError extends Failure {
  final String? message;
  ConnectionError({this.message});
}

class ErrorLoginEmail extends Failure {
  final String? message;
  ErrorLoginEmail({this.message});
}

class ErrorLogout extends Failure {
  final String? message;
  ErrorLogout({this.message});
}

class InternalError implements Failure {
  final String? message;
  InternalError({this.message});
}
