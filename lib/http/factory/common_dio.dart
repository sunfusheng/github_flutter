import 'package:dio/dio.dart';
import 'package:github_flutter/http/factory/base_dio.dart';
import 'package:github_flutter/http/interceptors/common_headers_interceptor.dart';

class CommonDio extends BaseDio {
  static Dio _dio;

  static Dio dio() {
    if (_dio == null) {
      _dio = CommonDio().createDio();
    }
    return _dio;
  }

  @override
  List<Interceptor> getExtraInterceptors() {
    List<Interceptor> interceptors = super.getExtraInterceptors();
    interceptors.add(CommonHeadersInterceptor());
    return interceptors;
  }
}
