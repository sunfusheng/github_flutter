import 'package:flutter/material.dart';
import 'package:github_flutter/pages/MainPage.dart';
import 'package:github_flutter/pages/SplashPage.dart';
import 'package:github_flutter/res/Constants.dart';
import 'package:github_flutter/res/StringsR.dart';
import 'package:github_flutter/utils/SharedPreferencesUtil.dart';
import 'package:rxdart/rxdart.dart';

import 'pages/LoginPage.dart';
import 'res/ThemesR.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    var tokenStream =
//        Stream.fromFuture(SharedPreferencesUtil.getString(PrefsKey.TOKEN));
//    var usernameStream =
//        Stream.fromFuture(SharedPreferencesUtil.getString(PrefsKey.USERNAME));
//    ZipStream.zip2(tokenStream, usernameStream,
//        (String token, String username) {
//      if (token != null &&
//          token.isNotEmpty &&
//          username != null &&
//          username.isNotEmpty) {
//        return MainPage();
//      }
//      return LoginPage();
//    }).listen((page) {
//      Navigator.push(context,
//          MaterialPageRoute(builder: (context) => page, maintainState: false));
//    });

    return MaterialApp(
      title: StringsR.appTitle,
      theme: ThemesR.mainTheme,
      home: LoginPage(),
    );
  }
}
