import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_flutter/res/ColorsR.dart';
import 'package:github_flutter/res/StringsR.dart';

class LoadingDialog extends Dialog {
  String text;

  LoadingDialog({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      color: Colors.transparent,
      child: Center(
        child: SizedBox(
          width: 120,
          height: 120,
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CupertinoActivityIndicator(radius: 20),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    text,
                    style: TextStyle(color: ColorsR.font2, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingDialogUtil {
  static show(BuildContext context, {String text}) {
    if (text == null || text.isEmpty) {
      text = StringsR.loading;
    }

    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      barrierColor: Colors.black45,
      transitionDuration: Duration.zero,
      pageBuilder: (context, animation, secondaryAnimation) =>
          LoadingDialog(text: text),
    ));
  }

  static hide(BuildContext context) {
    Navigator.pop(context);
  }
}
