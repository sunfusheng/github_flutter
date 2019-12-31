import 'package:flutter/material.dart';

import 'pages/splash_page.dart';
import 'res/strings.dart';
import 'res/styles.dart';

void main() {
  runApp(GitHubApp());
}

class GitHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringsR.appTitle,
      theme: StylesR.mainTheme,
      home: SplashPage(),
    );
  }
}
