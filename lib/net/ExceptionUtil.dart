import 'package:dio/dio.dart';
import 'package:github_flutter/net/ResponseData.dart';

class ExceptionUtil {
  // HTTP错误码
  static const int NO_CONTENT = 204;
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int REQUEST_TIMEOUT = 408;
  static const int UNPROCESSABLE_ENTITY = 422;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int BAD_GATEWAY = 502;
  static const int SERVICE_UNAVAILABLE = 503;
  static const int GATEWAY_TIMEOUT = 504;

  // 约定错误码
  static const int UNKNOWN = 1000; // 未知错误
  static const int PARSE_ERROR = 1001; // 数据解析异常
  static const int CONNECT_ERROR = 1002; // 连接失败
  static const int NETWORK_ERROR = 1003; // 网络错误
  static const int SSL_ERROR = 1005; // 证书验证失败
  static const int CONNECT_TIMEOUT = 1006; // 连接超时
  static const int SEND_TIMEOUT = 1007; // 请求超时
  static const int RECEIVE_TIMEOUT = 1008; // 响应超时
  static const int UNKNOWN_HOST = 1009; // 未知主机

  static ExceptionInfo exceptionInfo(int errorCode) {
    switch (errorCode) {
      case NO_CONTENT:
        return ExceptionInfo(NO_CONTENT, "无内容");
      case UNAUTHORIZED:
        return ExceptionInfo(UNAUTHORIZED, "授权异常，未授权");
      case FORBIDDEN:
        return ExceptionInfo(FORBIDDEN, "请求异常，拒绝执行");
      case NOT_FOUND:
        return ExceptionInfo(NOT_FOUND, "资源未找到");
      case REQUEST_TIMEOUT:
        return ExceptionInfo(REQUEST_TIMEOUT, "请求超时");
      case UNPROCESSABLE_ENTITY:
        return ExceptionInfo(UNPROCESSABLE_ENTITY, "请求参数错误，无法响应");
      case INTERNAL_SERVER_ERROR:
        return ExceptionInfo(INTERNAL_SERVER_ERROR, "服务器异常");
      case BAD_GATEWAY:
        return ExceptionInfo(BAD_GATEWAY, "网关异常");
      case SERVICE_UNAVAILABLE:
        return ExceptionInfo(SERVICE_UNAVAILABLE, "服务不可用");
      case GATEWAY_TIMEOUT:
        return ExceptionInfo(GATEWAY_TIMEOUT, "网关超时");
      case PARSE_ERROR:
        return ExceptionInfo(PARSE_ERROR, "数据解析异常");
      case CONNECT_ERROR:
        return ExceptionInfo(CONNECT_ERROR, "连接失败");
      case NETWORK_ERROR:
        return ExceptionInfo(NETWORK_ERROR, "网络错误");
      case SSL_ERROR:
        return ExceptionInfo(SSL_ERROR, "证书验证失败");
      case CONNECT_TIMEOUT:
        return ExceptionInfo(CONNECT_TIMEOUT, "连接超时");
      case SEND_TIMEOUT:
        return ExceptionInfo(SEND_TIMEOUT, "请求超时");
      case RECEIVE_TIMEOUT:
        return ExceptionInfo(RECEIVE_TIMEOUT, "响应超时");
      case UNKNOWN_HOST:
        return ExceptionInfo(UNKNOWN_HOST, "未知主机");
      default:
        return ExceptionInfo(UNKNOWN, "未知错误");
    }
  }

  static ResponseData responseData(int errorCode) {
    return ResponseData(
      code: errorCode,
      msg: exceptionInfo(errorCode).errorMsg,
    );
  }

  static ResponseData handleDioError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      return responseData(ExceptionUtil.CONNECT_TIMEOUT);
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      return responseData(ExceptionUtil.SEND_TIMEOUT);
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      return responseData(ExceptionUtil.RECEIVE_TIMEOUT);
    }
    return responseData(e.response?.statusCode);
  }
}

class ExceptionInfo {
  int errorCode;
  String errorMsg;

  ExceptionInfo(this.errorCode, this.errorMsg);
}
