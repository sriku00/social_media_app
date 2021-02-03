import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social_media_app/Screens/HomeScreen/home_screen.dart';
import 'package:social_media_app/Screens/LandingScreen/landing_helpers_screen.dart';
import 'package:social_media_app/Screens/loginScreen/login_screen.dart';
import 'package:social_media_app/Screens/signUpScreen/signup_screen.dart';
import 'package:social_media_app/Services/authentication_services.dart';
import 'package:social_media_app/Utils/colors_utils.dart';

// ignore: always_specify_types
final landingScreenWidgets =
    ChangeNotifierProvider<LandingScreenWidgets>((ProviderReference ref) {
  return LandingScreenWidgets();
});

class LandingScreenWidgets extends ChangeNotifier {
  ConstantColors constantColors = ConstantColors();
  // body Image widget
  Widget bodyImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
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
          constraints: const BoxConstraints(maxHeight: 170),
          child: RichText(
            // ignore: always_specify_types
            text: TextSpan(children: [
              const TextSpan(
                text: " ARe",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              const TextSpan(
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
              const TextSpan(
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
      // ignore: sized_box_for_whitespace
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                bottomSheet(context);
              },
              child: Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: constantColors.yellowColor, width: 2),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                    child: Icon(
                  EvaIcons.emailOutline,
                  color: constantColors.yellowColor,
                  size: 35,
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                context
                    .read(authentication)
                    .googleSignIn(context)
                    .whenComplete(() {
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
                decoration: BoxDecoration(
                  border: Border.all(color: constantColors.redColor, width: 2),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                    child: Icon(
                  EvaIcons.googleOutline,
                  color: constantColors.redColor,
                  size: 35,
                )),
              ),
            ),
            GestureDetector(
              child: Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: constantColors.blueColor, width: 2),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                    child: Icon(
                  EvaIcons.facebookOutline,
                  color: constantColors.blueColor,
                  size: 35,
                )),
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
      // ignore: avoid_unnecessary_containers
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

  // email buttton bottom sheet

  Future bottomSheet(BuildContext context) => showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: BoxDecoration(
            color: constantColors.blueGreyColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 140),
                child: Divider(
                  thickness: 4,
                  color: constantColors.whiteColor,
                ),
              ),
              context.read(landingHelpers).passwordLessSignIn(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    elevation: 18,
                    color: constantColors.blueColor,
                    onPressed: () {
                      //Todo:implement login
                      Navigator.push(
                          context,
                          PageTransition(
                              child: LogInScreen(),
                              duration: Duration(milliseconds: 200),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Text(
                      "LogIn",
                      style: TextStyle(
                          color: constantColors.whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  MaterialButton(
                    elevation: 18,
                    color: constantColors.redColor,
                    onPressed: () {
                      context.read(landingHelpers).userAvatarSheet(context);
                      // Navigator.push(
                      //     context,
                      //     PageTransition(
                      //         child: SignUpScreen(),
                      //         duration: Duration(milliseconds: 200),
                      //         type: PageTransitionType.bottomToTop));
                      //Todo:implement signIn function
                    },
                    child: Text(
                      "SigIn",
                      style: TextStyle(
                          color: constantColors.whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
