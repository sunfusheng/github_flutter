import 'package:flutter/material.dart';
import 'package:github_flutter/res/Constants.dart';
import 'package:github_flutter/res/StringsR.dart';
import 'package:github_flutter/res/ThemesR.dart';
import 'package:github_flutter/utils/SharedPreferencesUtil.dart';
import 'package:rxdart/rxdart.dart';

import 'LoginPage.dart';
import 'MainPage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    var tokenStream =
        Stream.fromFuture(SharedPreferencesUtil.getString(PrefsKey.TOKEN));
    var usernameStream =
        Stream.fromFuture(SharedPreferencesUtil.getString(PrefsKey.USERNAME));
    ZipStream.zip2(tokenStream, usernameStream,
        (String token, String username) {
      if (token != null &&
          token.isNotEmpty &&
          username != null &&
          username.isNotEmpty) {
        return MainPage();
      }
      return LoginPage();
    }).listen((page) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => page, maintainState: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
