import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_flutter/res/constants.dart';
import 'package:github_flutter/utils/shared_preferences_util.dart';
import 'package:rxdart/rxdart.dart';

import 'login_page.dart';
import 'main_page.dart';

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(backgroundColor: Colors.white),
    );
  }
}
