import 'package:flutter/material.dart';
import 'package:github_flutter/entity/EntityFactory.dart';
import 'package:github_flutter/entity/auth_entity.dart';
import 'package:github_flutter/net/Api.dart';
import 'package:github_flutter/net/ResponseData.dart';
import 'package:github_flutter/res/ColorsR.dart';
import 'package:github_flutter/res/Constants.dart';
import 'package:github_flutter/res/StringsR.dart';
import 'package:github_flutter/utils/EncryptionUtil.dart';
import 'package:github_flutter/utils/SharedPreferencesUtil.dart';
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
        hintText: StringsR.inputUsernameHint,
        hintStyle: TextStyle(
          color: ColorsR.font4,
          fontSize: 17,
        ),
        prefixIcon: Icon(Icons.person),
        suffixIcon: showClearIcon
            ? IconButton(
                icon: Icon(
                  Icons.clear,
                  color: ColorsR.font4,
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
          borderSide: BorderSide(width: 1, color: ColorsR.font4),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorsR.colorPrimary),
        ),
      ),
      style: TextStyle(
        color: ColorsR.font1,
        fontSize: 17,
      ),
      cursorColor: ColorsR.colorPrimary,
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
        hintText: StringsR.inputPasswordHint,
        hintStyle: TextStyle(
          color: ColorsR.font4,
          fontSize: 17,
        ),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            showPassword ? Icons.visibility : Icons.visibility_off,
            color: ColorsR.font4,
            size: 17,
          ),
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorsR.font4),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorsR.colorPrimary),
        ),
      ),
      style: TextStyle(
        color: ColorsR.font1,
        fontSize: 17,
      ),
      cursorColor: ColorsR.colorPrimary,
    );
  }

  // 创建登录组件
  Widget createLoginWidget() {
    return OutlineButton(
      child: SizedBox(
        height: 48,
        child: Center(
          child: Text(
            StringsR.login,
            style: TextStyle(color: ColorsR.colorPrimary, fontSize: 18),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: ColorsR.colorPrimary, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      color: Colors.white,
      highlightColor: ColorsR.colorPrimary_30,
      splashColor: Colors.white,
      highlightedBorderColor: ColorsR.colorPrimary,
      borderSide: BorderSide(color: ColorsR.colorPrimary),
      onPressed: login,
    );
  }

  void hideSoftKeyboard() {
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

  void login() async {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isEmpty) {
      ToastUtil.show(StringsR.inputUsernameHint);
      return;
    }

    if (password.isEmpty) {
      ToastUtil.show(StringsR.inputPasswordHint);
      return;
    }

    hideSoftKeyboard();
    SharedPreferencesUtil.setString(PrefsKey.USERNAME, username);

    var auth = EncryptionUtil.encodeBase64('$username:$password');
    SharedPreferencesUtil.setString(PrefsKey.AUTH, auth).then((it) async {
      var result = await LoginApi.fetchToken();
      print('login() ${result.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          hideSoftKeyboard();
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
                  StringsR.appAuthor,
                  style: TextStyle(color: ColorsR.font3, fontSize: 12),
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
