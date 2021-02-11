import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:social_media_app/Screens/LandingScreen/landing_widgets.dart';
import 'package:social_media_app/Utils/colors_utils.dart';

class LandingPage extends HookWidget {
  final ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    final provider = useProvider(landingWidgets);
    return Scaffold(
      backgroundColor: constantColors.whiteColor,
      body: Stack(
        children: [
          bodyColor(),
          provider.bodyImgae(context),
          provider.tagLineText(context),
          provider.bottomIcons(context),
          provider.footBarText(context),
        ],
      ),
    );
  }

  bodyColor() => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  constantColors.darkColor,
                  constantColors.blueGreyColor
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 0.9])),
      );
}
