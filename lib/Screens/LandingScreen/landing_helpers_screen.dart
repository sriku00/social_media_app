import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social_media_app/Screens/HomeScreen/home_screen.dart';
import 'package:social_media_app/Services/authentication_services.dart';
import 'package:social_media_app/Utils/colors_utils.dart';

final landingScreenServices =
    ChangeNotifierProvider<LandingScreenServices>((ref) {
  return LandingScreenServices();
});

class LandingScreenServices extends ChangeNotifier {
  ConstantColors constantColors = ConstantColors();
  // body Image widget
  Widget bodyImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login.png"),
        ),
      ),
    );
  }

  // Tag Line Widget
  Widget tagLineWidget(BuildContext context) {
    return Positioned(
        top: 500,
        left: 20,
        child: Container(
          constraints: BoxConstraints(maxHeight: 170),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: " ARe",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: " YoU",
                style: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.lightBlue,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: " SoCiaL",
                style: TextStyle(
                    fontFamily: "Poppins",
                    color: Theme.of(context).primaryColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: " ?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              )
            ]),
          ),
        ));
  }

  // Bottom Widget of landing page

  Widget buttonLanding(BuildContext context) {
    return Positioned(
      top: 630,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              child: Container(
                height: 40,
                width: 80,
                child: Center(
                    child: Icon(
                  EvaIcons.emailOutline,
                  color: constantColors.yellowColor,
                  size: 35,
                )),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: constantColors.yellowColor, width: 2),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.read(authentication).googleSignIn().whenComplete(() {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: HomeScreen(),
                          type: PageTransitionType.bottomToTop));
                });
              },
              child: Container(
                height: 40,
                width: 80,
                child: Center(
                    child: Icon(
                  EvaIcons.googleOutline,
                  color: constantColors.redColor,
                  size: 35,
                )),
                decoration: BoxDecoration(
                  border: Border.all(color: constantColors.redColor, width: 2),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                height: 40,
                width: 80,
                child: Center(
                    child: Icon(
                  EvaIcons.facebookOutline,
                  color: constantColors.blueColor,
                  size: 35,
                )),
                decoration: BoxDecoration(
                  border: Border.all(color: constantColors.blueColor, width: 2),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Bottom Terms and Conditions
  Widget landingFootBar(BuildContext context) {
    return Positioned(
      top: 750,
      left: 40,
      right: 20,
      child: Container(
        child: Column(
          children: [
            Text(
              "By continuing you  agreed to the Social app Terms , ",
              style: TextStyle(
                color: constantColors.greyColor,
              ),
            ),
            Text(
              " Services & Privacy Policy ",
              style: TextStyle(
                color: constantColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
