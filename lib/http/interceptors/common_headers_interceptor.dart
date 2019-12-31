import 'package:dio/dio.dart';
import 'package:github_flutter/res/constants.dart';
import 'package:github_flutter/utils/shared_preferences_util.dart';

class CommonHeadersInterceptor extends Interceptor {
  String _token;

  @override
  Future onRequest(RequestOptions options) async {
    if (_token == null) {
      var token = await SharedPreferencesUtil.getString(PrefsKey.TOKEN);
      if (token != null) {
        _token = token;
      }
    }
    options.headers['Authorization'] = 'token $_token';
    return super.onRequest(options);
  }
}
