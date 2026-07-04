import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movielab/constants/colors.dart';

void setSystemUIOverlayStyle({Color color = kBackgroundColor}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: color,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light));
}
