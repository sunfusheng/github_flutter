import 'package:dio/dio.dart';

class BaseDio {
  static const String BASE_URL = 'https://api.github.com';
  static const int CONNECT_TIMEOUT = 30000;
  static const int SEND_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;

  Dio createDio() {
    Dio dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: CONNECT_TIMEOUT,
      sendTimeout: SEND_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
    ));

    dio.interceptors.addAll(getExtraInterceptors());
    return dio;
  }

  List<Interceptor> getExtraInterceptors() {
    List<Interceptor> interceptors = List<Interceptor>();
    interceptors.add(LogInterceptor(
      request: false,
      requestHeader: true,
      responseHeader: false,
      responseBody: true,
    ));
    return interceptors;
  }
}
