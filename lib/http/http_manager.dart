import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:github_flutter/http/http_exception_handler.dart';
import 'package:github_flutter/res/constants.dart';

import 'response_data.dart';

class HttpManager {
  static Dio _dio;

  static _getDio() {
    if (_dio == null) {
      _dio = Dio(BaseOptions(
        baseUrl: Constants.BASE_URL,
        connectTimeout: 30000,
        sendTimeout: 30000,
        receiveTimeout: 30000,
      ));
      _dio.interceptors.add(LogInterceptor(
        request: false,
        requestHeader: true,
        responseHeader: false,
        responseBody: true,
      ));
    }
    return _dio;
  }

  // GET请求
  static get(path, {params, headers}) async =>
      await _request(path, params, headers, Options(method: "GET"));

  // POST请求
  static post(path, {params, headers}) async =>
      await _request(path, params, headers, Options(method: 'POST'));

  // 网络请求
  static _request(path, params, headers, Options options) async {
    bool connected = await isConnected();
    if (!connected) {
      return HttpExceptionHandler.responseData(
          HttpExceptionHandler.NETWORK_ERROR);
    }

    if (headers != null) {
      options.headers = headers;
    }

    Dio dio = _getDio();
    Response response;
    try {
      if (options.method == 'GET') {
        response =
            await dio.get(path, queryParameters: params, options: options);
      } else {
        response = await dio.request(path, data: params, options: options);
      }
    } on DioError catch (e) {
      return HttpExceptionHandler.handleDioError(e);
    }

    if (response?.statusCode == 200 || response?.statusCode == 201) {
      return ResponseData(code: 0, msg: 'OK', json: response.data);
    } else {
      return HttpExceptionHandler.responseData(response?.statusCode);
    }
  }

  // 判断网络是否连接
  static Future<bool> isConnected() async {
    var result = await (Connectivity().checkConnectivity());
    return result != ConnectivityResult.none;
  }
}
