import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:github_flutter/net/ExceptionUtil.dart';
import 'package:github_flutter/res/Constants.dart';

import 'ResponseData.dart';

class NetUtil {
  // GET请求
  static get(path, {params, headers}) async =>
      await _request(path, params, headers, Options(method: "GET"));

  // POST请求
  static post(path, {params, headers}) async =>
      await _request(path, params, headers, Options(method: 'POST'));

  // 网络请求
  static _request(path, params, headers, options) async {
    bool connected = await isConnected();
    if (!connected) {
      return ExceptionUtil.responseData(ExceptionUtil.NETWORK_ERROR);
    }

    if (headers != null) {
      options.headers = headers;
    }

    Response response;
    try {
      response = await _getDio().request(path, data: params, options: options);
    } on DioError catch (e) {
      return ExceptionUtil.handleDioError(e);
    }

    if (response?.statusCode == 200 || response?.statusCode == 201) {
      return ResponseData(code: 0, msg: 'OK', json: response.data);
    }
    return ExceptionUtil.responseData(response?.statusCode);
  }

  static Dio _dio;

  static _getDio() {
    if (_dio == null) {
      _dio = Dio(BaseOptions(
        baseUrl: Constants.BASE_URL,
        connectTimeout: 30000,
        sendTimeout: 30000,
        receiveTimeout: 30000,
      ));
      _dio.interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options) {
          print(
              'sfs 【onRequest】 url: ${options?.uri?.toString()} method: ${options?.method} \ndata: ${options?.data} \nheaders:${options?.headers}');
          return options;
        }, onResponse: (Response response) {
          print(
              'sfs 【onResponse】 statusCode: ${response?.statusCode} \ndata: ${response?.data?.toString()}');
          return response;
        }, onError: (DioError err) {
          print('sfs 【onError】 ${err?.toString()}');
          return err;
        }),
      );
    }
    return _dio;
  }

  // 判断网络是否连接
  static Future<bool> isConnected() async {
    var result = await (Connectivity().checkConnectivity());
    return result != ConnectivityResult.none;
  }
}
