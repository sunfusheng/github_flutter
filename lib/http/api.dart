import 'package:github_flutter/models/auth_model.dart';
import 'package:github_flutter/models/event_model.dart';
import 'package:github_flutter/models/user_model.dart';
import 'package:github_flutter/http/http_manager.dart';
import 'package:github_flutter/http/response_data.dart';
import 'package:github_flutter/res/constants.dart';

import 'factory/login_dio.dart';

class LoginApi {
  static fetchTokenByAuth() async {
    ResponseData response = await HttpManager.post(
      dio: LoginDio.dio,
      path: '/authorizations',
      params: {
        'note': Constants.NOTE,
        'note_url': Constants.NOTE_URL,
        'client_id': Constants.CLIENT_ID,
        'client_secret': Constants.CLIENT_SECRET,
        'scopes': Constants.SCOPES,
      },
    );
    return response.parseJson<AuthModel>();
  }

  static fetchUserByAuth() async {
    ResponseData response = await HttpManager.get(
      dio: LoginDio.dio,
      path: '/user',
    );
    return response.parseJson<UserModel>();
  }
}

class Api {
  static fetchReceivedEvents(String username, int page, int pageCount) async {
    ResponseData response = await HttpManager.get(
      path: '/users/$username/received_events',
      params: {
        'page': page,
        'per_page': pageCount,
      },
    );
    return response.parseJson<EventModel>();
  }
}
