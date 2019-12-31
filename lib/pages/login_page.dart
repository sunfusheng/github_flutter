import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_flutter/models/auth.dart';
import 'package:github_flutter/models/user.dart';
import 'package:github_flutter/http/api.dart';
import 'package:github_flutter/http/response_data.dart';
import 'package:github_flutter/pages/main_page.dart';
import 'package:github_flutter/res/colors.dart';
import 'package:github_flutter/res/constants.dart';
import 'package:github_flutter/res/strings.dart';
import 'package:github_flutter/utils/encryption_util.dart';
import 'package:github_flutter/utils/shared_preferences_util.dart';
import 'package:github_flutter/utils/toast_util.dart';
import 'package:github_flutter/widgets/loading_dialog.dart';
import 'package:rxdart/rxdart.dart';

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
                  size: 20,
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
        setState(() {
          showClearIcon = it.length > 0;
        });
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
            size: 20,
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

  // 隐藏软键盘
  void hideSoftKeyboard() {
    if (usernameFocusNode.hasFocus) {
      usernameFocusNode.unfocus();
    }
    if (passwordFocusNode.hasFocus) {
      passwordFocusNode.unfocus();
    }
  }

  TextEditingController usernameController =
      TextEditingController(text: 'sunfusheng');
  TextEditingController passwordController = TextEditingController();

  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  bool showClearIcon = true;
  bool showPassword = false;

  // 登录
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

    LoadingDialogUtil.show(context, text: StringsR.logging);
    hideSoftKeyboard();

    var auth = EncryptionUtil.encodeBase64('$username:$password');
    SharedPreferencesUtil.setString(PrefsKey.AUTH, auth).then((it) {
      ZipStream.zip2(Stream.fromFuture(LoginApi.fetchTokenByAuth()),
          Stream.fromFuture(LoginApi.fetchUserByAuth()), (auth, user) {
        ResponseData<Auth> authResponse = auth;
        ResponseData<User> userResponse = user;

        if (authResponse.code == 0 && userResponse.code == 0) {
          SharedPreferencesUtil.setString(
              PrefsKey.TOKEN, authResponse.data.token);
          SharedPreferencesUtil.setString(
              PrefsKey.USERNAME, userResponse.data.login);
          return true;
        }
        ToastUtil.show(authResponse.msg);
        return false;
      }).listen((it) {
        LoadingDialogUtil.hide(context);
        if (it) {
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                transitionDuration: Duration.zero,
                pageBuilder: (context, animation, secondaryAnimation) =>
                    MainPage(),
              ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
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
