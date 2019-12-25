import 'package:github_flutter/net/NetUtil.dart';
import 'package:github_flutter/res/Constants.dart';

class Api {
  static createAuth() async {
    return NetUtil.post(
      Constants.BASE_URL_API_GITHUB + 'authorizations',
      {
        'note': Constants.NOTE,
        'note_url': Constants.NOTE_URL,
        'client_id': Constants.CLIENT_ID,
        'client_secret': Constants.CLIENT_SECRET,
//        'scopes': Constants.SCOPES,
      },
    );
  }
}
