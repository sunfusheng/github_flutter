import 'package:github_flutter/models/auth.dart';
import 'package:github_flutter/models/user.dart';
import 'package:github_flutter/http/http_manager.dart';
import 'package:github_flutter/http/response_data.dart';
import 'package:github_flutter/res/constants.dart';

import 'factory/login_dio.dart';

class LoginApi {
  static fetchTokenByAuth() async {
    ResponseData response = await HttpManager.post(
      dio: LoginDio.dio(),
      path: '/authorizations',
      params: {
        'note': Constants.NOTE,
        'note_url': Constants.NOTE_URL,
        'client_id': Constants.CLIENT_ID,
        'client_secret': Constants.CLIENT_SECRET,
        'scopes': Constants.SCOPES,
      },
    );
    return response.parseJson<Auth>();
  }

  static fetchUserByAuth() async {
    ResponseData response = await HttpManager.get(
      dio: LoginDio.dio(),
      path: '/user',
    );
    return response.parseJson<User>();
  }
}

class Api {

}
