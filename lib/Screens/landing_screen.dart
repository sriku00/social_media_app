import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:social_media_app/Services/landing_screen_services.dart';
import 'package:social_media_app/Utils/colors_utils.dart';

// ignore: must_be_immutable
class LandingScreen extends HookWidget {
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    final provider = useProvider(landingScreenServices);
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

Widget bodyColor() {
  ConstantColors constantColors = ConstantColors();
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.5, 0.9],
        colors: [
          constantColors.darkColor,
          constantColors.blueGreyColor,
        ],
      ),
    ),
  );
}
