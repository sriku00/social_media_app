import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eva_icons_flutter/icon_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social_media_app/Screens/HomeScreen/home_screen.dart';
import 'package:social_media_app/Services/authentication_services.dart';
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
              // google login implementation
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
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: constantColors.blueColor, width: 2),
                  ),
                  child: Icon(
                    EvaIcons.googleOutline,
                    size: 30,
                    color: constantColors.blueColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  // bottom Privacy policiy widget

  Widget footBarText(BuildContext context) => Positioned(
        top: 750,
        left: 20,
        right: 20,
        child: Container(
          child: Column(
            children: [
              Text(
                "By continuing you are agreed to the  Terms and conditions ",
                style: kSmallTextStyle.copyWith(
                    color: constantColors.greyColor, fontSize: 12),
              ),
              Text(
                "of the SocialApp",
                style: kSmallTextStyle.copyWith(
                    color: constantColors.greyColor, fontSize: 12),
              )
            ],
          ),
        ),
      );

// Model Bottom Sheet
// Model Bottom Sheet Containing login And sign in
  bottomLoginAdnSignSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
            child: Column(
              children: [],
            ),
          );
        });
  }
}
