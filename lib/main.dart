import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub LoginPage',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: '请输入用户名或邮箱',
                    labelText: '账号: ',
                  ),
                  validator: (text) {
                    return null;
                  },
                ),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: '请输入密码',
                    labelText: '密码: ',
                  ),
                  validator: (text) {
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
