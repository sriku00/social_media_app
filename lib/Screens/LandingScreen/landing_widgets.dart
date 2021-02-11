import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eva_icons_flutter/icon_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:social_media_app/Utils/constant_styles.dart';

final landingWidgets = ChangeNotifierProvider<LandingWidgets>((ref) {
  return LandingWidgets();
});

class LandingWidgets extends ChangeNotifier {
  final ConstantColors constantColors = ConstantColors();

  // the image Body widget

  Widget bodyImgae(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login.png"),
        ),
      ),
    );
  }

  // TagLIne Widget

  Widget tagLineText(BuildContext context) => Positioned(
        top: 540,
        left: 100,
        child: Container(
          constraints: BoxConstraints(maxWidth: 260),
          child: RichText(
            text:
                TextSpan(text: " WelCome", style: kBiggerTextStyle, children: [
              TextSpan(
                  text: " To ",
                  style: TextStyle(color: constantColors.greenColor)),
              TextSpan(
                  text: " Social ",
                  style: TextStyle(color: constantColors.blueColor))
            ]),
          ),
        ),
      );

  // Icons Widget
  Widget bottomIcons(BuildContext context) => Positioned(
        top: 630,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(color: constantColors.yellowColor, width: 2),
                ),
                child: Icon(
                  EvaIcons.emailOutline,
                  size: 30,
                  color: constantColors.yellowColor,
                ),
              ),
              Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: constantColors.blueColor, width: 2),
                ),
                child: Icon(
                  EvaIcons.googleOutline,
                  size: 30,
                  color: constantColors.blueColor,
                ),
              ),
            ],
          ),
        ),
      );
}
