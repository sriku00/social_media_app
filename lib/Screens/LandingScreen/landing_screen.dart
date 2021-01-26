import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/all.dart';
import 'package:social_media_app/Screens/LandingScreen/landing_widgets_screen.dart';

import 'package:social_media_app/Utils/colors_utils.dart';

// ignore: must_be_immutable
class LandingScreen extends HookWidget {
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    final provider = useProvider(landingScreenWidgets);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          bodyColor(),
          provider.bodyImage(context),
          provider.tagLineWidget(context),
          provider.buttonLanding(context),
          provider.landingFootBar(context)
        ],
      ),
    );
  }
}

// body colour widget
Widget bodyColor() {
  final ConstantColors constantColors = ConstantColors();
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // ignore: prefer_const_literals_to_create_immutables
        stops: [0.5, 0.9],
        colors: [
          constantColors.darkColor,
          constantColors.blueGreyColor,
        ],
      ),
    ),
  );
}
