import 'package:flutter/material.dart';

import 'pages/LoginPage.dart';
import 'resource/ThemeRes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub LoginPage',
      theme: ThemeRes.mainTheme,
      home: LoginPage(),
    );
  }
}
