import 'package:github_flutter/net/NetUtil.dart';
import 'package:github_flutter/res/Constants.dart';

class Api {
  static createAuth() async {
    return NetUtil.post(Constants.BASE_URL_API_GITHUB + 'authorizations', {});
  }
}
