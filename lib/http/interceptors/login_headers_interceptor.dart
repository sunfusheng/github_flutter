import 'package:dio/dio.dart';
import 'package:github_flutter/res/constants.dart';
import 'package:github_flutter/utils/shared_preferences_util.dart';

class LoginHeadersInterceptor extends Interceptor {
  String _auth;

  @override
  Future onRequest(RequestOptions options) async {
    if (_auth == null) {
      var auth = await SharedPreferencesUtil.getString(PrefsKey.AUTH);
      if (auth != null) {
        _auth = auth;
      }
    }
    options.headers['Accept'] = Constants.ACCEPT_JSON;
    options.headers['Authorization'] = 'Basic $_auth';
    return super.onRequest(options);
  }
}
