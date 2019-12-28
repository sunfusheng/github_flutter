import 'dart:collection';

import 'package:github_flutter/entity/auth_entity.dart';
import 'package:github_flutter/entity/user_entity.dart';
import 'package:github_flutter/net/NetUtil.dart';
import 'package:github_flutter/net/ResponseData.dart';
import 'package:github_flutter/res/Constants.dart';
import 'package:github_flutter/utils/SharedPreferencesUtil.dart';

class LoginApi {
  static _getHeaders() async {
    Map<String, String> headers = HashMap<String, String>();
    headers['Accept'] = Constants.ACCEPT_JSON;
    var auth = await SharedPreferencesUtil.getString(PrefsKey.AUTH);
    if (auth != null) {
      headers['Authorization'] = 'Basic $auth';
    }
    return headers;
  }

  static fetchToken() async {
    ResponseData response = await NetUtil.post('/authorizations',
        params: {
          'note': Constants.NOTE,
          'note_url': Constants.NOTE_URL,
          'client_id': Constants.CLIENT_ID,
          'client_secret': Constants.CLIENT_SECRET,
          'scopes': Constants.SCOPES,
        },
        headers: await _getHeaders());
    return response.parseJson<Auth>();
  }

  static fetchUser() async {
    ResponseData response =
        await NetUtil.get('/user', headers: await _getHeaders());
    return response.parseJson<User>();
  }
}

class Api {}
