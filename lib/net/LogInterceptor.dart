import 'package:dio/dio.dart';

class LogInterceptor extends InterceptorsWrapper {

  @override
  Future onRequest(RequestOptions options) {
    print(
        'sfs 【onRequest】 url: ${options?.uri?.toString()} \ndata: ${options?.data} \nheaders:${options?.headers}');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print(
        'sfs 【onResponse】 statusCode: ${response?.statusCode} \ndata: ${response?.data?.toString()}');
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print('sfs 【onError】 ${err?.toString()}');
    return super.onError(err);
  }

  LogInterceptor();
}
