import 'package:flutter/material.dart';
import 'package:github_flutter/resource/ColorRes.dart';
import 'package:github_flutter/resource/StringRes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget createUsernameWidget() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: StringRes.inputUsernameHint,
        hintStyle: TextStyle(
          color: ColorRes.font4,
          fontSize: 17,
        ),
        prefixIcon: Icon(Icons.person),
        border: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorRes.font4),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorRes.colorPrimary),
        ),
      ),
      style: TextStyle(
        color: ColorRes.font1,
        fontSize: 17,
      ),
      cursorColor: ColorRes.colorPrimary,
    );
  }

  Widget createPasswordWidget() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: StringRes.inputPasswordHint,
        hintStyle: TextStyle(
          color: ColorRes.font4,
          fontSize: 17,
        ),
        prefixIcon: Icon(Icons.lock),
        border: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorRes.font4),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorRes.colorPrimary),
        ),
      ),
      style: TextStyle(
        color: ColorRes.font1,
        fontSize: 17,
      ),
      cursorColor: ColorRes.colorPrimary,
    );
  }

  Widget createLoginWidget() {
    return OutlineButton(
      child: SizedBox(
        height: 48,
        child: Center(
          child: Text(
            StringRes.login,
            style: TextStyle(color: ColorRes.colorPrimary, fontSize: 18),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: ColorRes.colorPrimary, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      color: Colors.white,
      highlightColor: ColorRes.colorPrimary_30,
      splashColor: Colors.white,
      highlightedBorderColor: ColorRes.colorPrimary,
      borderSide: BorderSide(color: ColorRes.colorPrimary),
      onPressed: login,
    );
  }

  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                createUsernameWidget(),
                SizedBox(height: 10),
                createPasswordWidget(),
                SizedBox(height: 60),
                createLoginWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
