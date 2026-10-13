import 'package:taskkk/core/common/custom_exception.dart';

String extractErrorMessage(Exception? ex) {
  if (ex is NoInternetError) {
    return 'please check internet connection';
  }
  if (ex is ServerError) {
    return ex.serverMessage ?? 'something went wrong';
  }
  if (ex is DioHttpException) {
    return ex.exception?.message ?? 'something went wrong';
  }
  if (ex is FirebaseAuthError) {
    return ex.message ?? 'something went wrong';
  }
  return 'something went wrong';
}
