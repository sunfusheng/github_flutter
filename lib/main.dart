import 'package:flutter/material.dart';
import 'package:github_flutter/pages/SplashPage.dart';
import 'package:github_flutter/res/StringsR.dart';

import 'res/ThemesR.dart';

void main() {
  runApp(GitHubApp());
}

class GitHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringsR.appTitle,
      theme: ThemesR.mainTheme,
      home: SplashPage(),
    );
  }
}
