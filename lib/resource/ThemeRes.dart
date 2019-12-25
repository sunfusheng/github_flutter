import 'package:flutter/material.dart';

import 'ColorRes.dart';

class ThemeRes {
  static ThemeData mainTheme = ThemeData(
    primaryColor: ColorRes.colorPrimary,
    primaryColorDark: ColorRes.colorPrimary,
    accentColor: ColorRes.colorPrimary,
    primaryColorBrightness: Brightness.light,
    focusColor: ColorRes.colorPrimary,
    backgroundColor: Colors.white,
  );
}
