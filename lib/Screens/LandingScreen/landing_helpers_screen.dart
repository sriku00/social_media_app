// signIN Bottom sheet
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/Services/userdata_services.dart';
import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:social_media_app/Utils/constant_styles.dart';

// ignore: always_specify_types
final landingHelpers = ChangeNotifierProvider<LandingHelpersScreen>((ref) {
  return LandingHelpersScreen();
});

class LandingHelpersScreen extends ChangeNotifier {
  ConstantColors constantColors = ConstantColors();

  // BottomSheet Widget

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
              context.read(userDataServices).passwordLessSignIn(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    elevation: 18,
                    color: constantColors.blueColor,
                    onPressed: () {
                      //Todo:implement login
                      context.read(landingHelpers).loginSheet(context);
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
                      //Todo:implement signIn function
                      context.read(landingHelpers).signInSheet(context);
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

  // signIN Bottom sheet
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController conformPasswordTextController = TextEditingController();

  Future signInSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
                color: constantColors.darkColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // ignore: always_specify_types
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: Divider(
                    thickness: 4,
                    color: constantColors.whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  backgroundColor: constantColors.redColor,
                  radius: 80,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    style: kSmallTextStyle,
                    controller: userNameTextController,
                    decoration: const InputDecoration(
                      hintText: "Enter Your Name",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: kSmallTextStyle,
                    controller: emailTextController,
                    decoration: const InputDecoration(
                      hintText: "email",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    style: kSmallTextStyle,
                    obscureText: true,
                    controller: passwordTextController,
                    decoration: const InputDecoration(
                      hintText: "password",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    style: kSmallTextStyle,
                    obscureText: true,
                    controller: conformPasswordTextController,
                    decoration: const InputDecoration(
                      hintText: "conform password",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: constantColors.blueColor,
                  onPressed: () {},
                  elevation: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      "SignIn",
                      style: kSmallTextStyle,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
  // logi Bottom Sheet //

  // ignore: always_specify_types
  Future loginSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      // ignore: always_specify_types
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: constantColors.blueGreyColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // ignore: always_specify_types
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 140),
                child: Divider(
                  thickness: 4,
                  color: constantColors.whiteColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  decoration:
                      const InputDecoration(hintText: "Enter your Name"),
                  controller: userNameTextController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: passwordTextController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Text("sign"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
