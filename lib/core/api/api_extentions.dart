import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:taskkk/core/common/api_result.dart';
import 'package:taskkk/core/common/custom_exception.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    final result = await apiCall();
    return Success(result);
  } on TimeoutException {
    return Fail(NoInternetError());
  } on IOException {
    return Fail(NoInternetError());
  } on DioException catch (ex) {
    var message = 'حدث خطأ غير متوقع';
    final data = ex.response?.data;
    if (data is Map && data['message'] != null) {
      message = data['message'].toString();
    } else if (data is String) {
      try {
        final decoded = jsonDecode(data);
        if (decoded is Map && decoded['message'] != null) {
          message = decoded['message'].toString();
        }
      } on FormatException {
        message = 'حدث خطأ غير متوقع';
      }
    }
    log(message);
    if (ex.response != null) {
      return Fail(
        ServerError(
          statusCode: ex.response?.statusCode,
          serverMessage: message.toString(),
        ),
      );
    }
    return Fail(DioHttpException(ex));
  } on Exception catch (ex) {
    return Fail(ex);
  }
}
