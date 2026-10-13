import 'package:dio/dio.dart';

class ServerError implements Exception {
  final String? serverMessage;
  final int? statusCode;

  ServerError({this.serverMessage, this.statusCode});
}

class DioHttpException implements Exception {
  final DioException? exception;

  DioHttpException(this.exception);
}

class NoInternetError implements Exception {}

class FirebaseAuthError implements Exception {
  final String? message;

  FirebaseAuthError(this.message);
}
