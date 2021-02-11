import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social_media_app/Screens/LandingScreen/landing_page.dart';
import 'package:social_media_app/Services/authentication_services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
            onTap: () {
              context
                  .read(authentication)
                  .googleSignOut(context)
                  .whenComplete(() {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: LandingPage(),
                        type: PageTransitionType.bottomToTop));
              });
            },
            child: Text("HomeSCreen")),
      ),
    );
  }
}
