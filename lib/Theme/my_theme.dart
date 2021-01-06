import 'package:flutter/material.dart';
import 'package:social_media_app/Utils/Constantcolors.dart';

class MyTheme {
  ConstantColors constantColors;
  myTheme() {
    return ThemeData(
      accentColor: constantColors.blueColor,
      fontFamily: "Poppins",
      canvasColor: constantColors.transperant,

    );
  }
}
