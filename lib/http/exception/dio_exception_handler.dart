import 'package:dio/dio.dart';
import 'package:github_flutter/http/exception/http_exception_handler.dart';

import '../response_data.dart';

class DioExceptionHandler {
  static ResponseData handleDioException(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      return HttpExceptionHandler.handleHttpException(
          HttpExceptionHandler.CONNECT_TIMEOUT);
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      return HttpExceptionHandler.handleHttpException(
          HttpExceptionHandler.SEND_TIMEOUT);
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      return HttpExceptionHandler.handleHttpException(
          HttpExceptionHandler.RECEIVE_TIMEOUT);
    }
    return HttpExceptionHandler.handleHttpException(e.response?.statusCode);
  }
}
