import 'package:flutter/material.dart';
import 'package:github_flutter/res/constants.dart';
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
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: Duration.zero,
            pageBuilder: (context, animation, secondaryAnimation) => page,
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white);
  }
}
