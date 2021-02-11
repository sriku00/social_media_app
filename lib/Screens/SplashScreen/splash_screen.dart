import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social_media_app/Screens/LandingScreen/landing_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context,
            // ignore: always_specify_types
            PageTransition(
                child: LandingPage(), type: PageTransitionType.bottomToTop)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: RichText(
          text: TextSpan(text: "The", children: [
            TextSpan(
              text: " Socail",
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ]),
        ),
      ),
    );
  }
}
