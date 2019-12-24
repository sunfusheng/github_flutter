import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:github_flutter/resource/ColorRes.dart';

class ToastUtil {
  static void show(String content) {
    Fluttertoast.showToast(
        msg: content,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: ColorRes.font2,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
