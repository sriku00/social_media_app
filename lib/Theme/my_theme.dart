import 'package:flutter/material.dart';
import 'package:social_media_app/Utils/colors_utils.dart';

class MyTheme {
  ConstantColors constantColors = ConstantColors();
  myTheme() {
    return ThemeData(
        accentColor: constantColors.blueColor,
        fontFamily: "Poppins",
        canvasColor: constantColors.transperant,
        backgroundColor: constantColors.darkColor);
  }
}
