import 'package:flutter/material.dart';
import 'package:github_flutter/resource/ColorRes.dart';
import 'package:github_flutter/resource/StringRes.dart';
import 'package:github_flutter/utils/ToastUtil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 创建用户名组件
  Widget createUsernameWidget() {
    return TextFormField(
      controller: usernameController,
      focusNode: usernameFocusNode,
      autofocus: false,
      decoration: InputDecoration(
        hintText: StringRes.inputUsernameHint,
        hintStyle: TextStyle(
          color: ColorRes.font4,
          fontSize: 17,
        ),
        prefixIcon: Icon(Icons.person),
        suffixIcon: showClearIcon
            ? IconButton(
                icon: Icon(
                  Icons.clear,
                  color: ColorRes.font4,
                  size: 17,
                ),
                onPressed: () {
                  usernameController.clear();
                  showClearIcon = false;
                  setState(() {});
                },
              )
            : null,
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
      onChanged: (it) {
        showClearIcon = it.length > 0;
        setState(() {});
      },
    );
  }

  // 创建密码组件
  Widget createPasswordWidget() {
    return TextFormField(
      controller: passwordController,
      focusNode: passwordFocusNode,
      autofocus: false,
      obscureText: !showPassword,
      decoration: InputDecoration(
        hintText: StringRes.inputPasswordHint,
        hintStyle: TextStyle(
          color: ColorRes.font4,
          fontSize: 17,
        ),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            showPassword ? Icons.visibility : Icons.visibility_off,
            color: ColorRes.font4,
            size: 17,
          ),
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
        ),
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

  // 创建登录组件
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

  void unfocusAll() {
    if (usernameFocusNode.hasFocus) {
      usernameFocusNode.unfocus();
    }
    if (passwordFocusNode.hasFocus) {
      passwordFocusNode.unfocus();
    }
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  bool showClearIcon = false;
  bool showPassword = false;

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;
    if (username.isEmpty) {
      ToastUtil.show(StringRes.inputUsernameHint);
      return;
    }

    print('username: $username');

    if (password.isEmpty) {
      ToastUtil.show(StringRes.inputPasswordHint);
      return;
    }

    print('password: $password');

    unfocusAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          unfocusAll();
        },
        child: Stack(
          children: <Widget>[
            Align(
              alignment: FractionalOffset.center,
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
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
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  StringRes.appAuthor,
                  style: TextStyle(
                    color: ColorRes.font3,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
