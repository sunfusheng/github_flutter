import 'package:dio/dio.dart';
import 'package:github_flutter/http/factory/base_dio.dart';
import 'package:github_flutter/http/interceptors/login_headers_interceptor.dart';

class LoginDio extends BaseDio {
  static Dio _dio;

  static Dio get dio {
    if (_dio == null) {
      _dio = LoginDio().createDio();
    }
    return _dio;
  }

  @override
  List<Interceptor> getExtraInterceptors() {
    List<Interceptor> interceptors = super.getExtraInterceptors();
    interceptors.add(LoginHeadersInterceptor());
    return interceptors;
  }
}
