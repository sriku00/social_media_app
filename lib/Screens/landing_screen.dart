import 'package:flutter/material.dart';
import 'package:social_media_app/Utils/colors_utils.dart';

// ignore: must_be_immutable
class LandingScreen extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}

bodyColor() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 0.9],
            colors: []),
      ),
    );
