import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eva_icons_flutter/icon_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social_media_app/Screens/HomeScreen/home_screen.dart';
import 'package:social_media_app/Screens/LandingScreen/landing_bottomsheets.dart';
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
              GestureDetector(
                onTap: () {
                  bottomLoginAdnSignSheet(context);
                },
                child: Container(
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
        elevation: 15,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: constantColors.darkColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 160),
                    child: Divider(
                      thickness: 5,
                      color: constantColors.greyColor,
                    ),
                  ),
                  SizedBox(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: constantColors.blueColor),
                          onPressed: () {
                            //     Todo: implement the login fuctionality;
                          },
                          child: Text(
                            "Login",
                            style: kSmallTextStyle,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: constantColors.yellowColor),
                          clipBehavior: Clip.none,
                          onPressed: () {
                            //     Todo: implement the sigiN fuctionality;
                            context
                                .read(landingBottomSheets)
                                .emailBottomSheet(context);
                          },
                          child: Text(
                            "SigIn",
                            style:
                                kSmallTextStyle.copyWith(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
