import 'dart:collection';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:github_flutter/net/ExceptionUtil.dart';
import 'package:github_flutter/res/Constants.dart';

import 'ResponseData.dart';

class NetUtil {
  static const int TIMEOUT = 60 * 1000; // 60s

  static Future<ResponseData> get(url, param) async {
    return await request(url, param, Options(method: "GET"));
  }

  static Future<ResponseData> post(url, param) async {
    return await request(url, param, Options(method: 'POST'));
  }

  // 请求网络
  static Future<ResponseData> request(
      String url, params, Options options) async {
    bool connected = await isConnected();
    if (!connected) {
      return ExceptionUtil.responseData(ExceptionUtil.NETWORK_ERROR);
    }

    if (options == null) {
      options = Options(method: 'GET');
    }
    Map<String, String> headers = HashMap<String, String>();
    headers['Accept'] = Constants.ACCEPT_JSON;
    options.headers = headers;
    options.sendTimeout = TIMEOUT;
    options.receiveTimeout = TIMEOUT;

    Dio dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        print(
            'sfs [onRequest] url: ${options.uri.toString()} data: ${options.data}');
      },
      onResponse: (Response response) {
        print(
            'sfs [onResponse] statusCode: ${response.statusCode} data: ${response.data}');
      },
      onError: (DioError e) {
        print('sfs [onError] ${e.toString()}');
      },
    ));

    Response response;
    try {
      response = await dio.request(url, data: params, options: options);
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        return ExceptionUtil.responseData(ExceptionUtil.CONNECT_TIMEOUT);
      } else if (e.type == DioErrorType.SEND_TIMEOUT) {
        return ExceptionUtil.responseData(ExceptionUtil.SEND_TIMEOUT);
      } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        return ExceptionUtil.responseData(ExceptionUtil.RECEIVE_TIMEOUT);
      } else {
        if (e != null && e.response != null) {
          return ExceptionUtil.responseData(e.response.statusCode);
        }
        return ExceptionUtil.responseData(ExceptionUtil.UNKNOWN);
      }
    }

    if (response == null) {
      return ExceptionUtil.responseData(ExceptionUtil.NETWORK_ERROR);
    }

    return ResponseData(
        code: response.statusCode, msg: '', data: response.data);
  }

  // 判断网络是否连接
  static Future<bool> isConnected() async {
    var result = await (Connectivity().checkConnectivity());
    return result != ConnectivityResult.none;
  }
}
