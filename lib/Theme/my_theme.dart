import 'package:flutter/material.dart';
import 'package:social_media_app/Utils/colors_utils.dart';

class MyTheme {
  ConstantColors constantColors = ConstantColors();
  ThemeData myTheme() {
    return ThemeData(
      accentColor: constantColors.blueColor,
      fontFamily: "Poppins",
      canvasColor: constantColors.transperant,
      backgroundColor: constantColors.darkColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
        hintStyle: TextStyle(
            color: constantColors.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(
            width: 2,
            color: constantColors.whiteColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            width: 4,
            color: constantColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
