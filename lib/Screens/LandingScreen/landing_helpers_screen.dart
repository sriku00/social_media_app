// signIN Bottom sheet
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:social_media_app/Utils/constant_styles.dart';

final landingServices = ChangeNotifierProvider<LandingHelpersScreen>((ref) {
  return LandingHelpersScreen();
});

class LandingHelpersScreen extends ChangeNotifier {
  ConstantColors constantColors = ConstantColors();

  // signIN Bottom sheet
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController conformPasswordTextController = TextEditingController();

  signInSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              decoration: BoxDecoration(
                  color: constantColors.darkColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 140),
                    child: Divider(
                      thickness: 4,
                      color: constantColors.whiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: constantColors.redColor,
                    radius: 80,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      style: kSmallTextStyle,
                      controller: userNameTextController,
                      decoration: InputDecoration(
                        hintText: "Enter Your Name",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: kSmallTextStyle,
                      controller: emailTextController,
                      decoration: InputDecoration(
                        hintText: "email",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      style: kSmallTextStyle,
                      obscureText: true,
                      controller: passwordTextController,
                      decoration: InputDecoration(
                        hintText: "password",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      style: kSmallTextStyle,
                      obscureText: true,
                      controller: conformPasswordTextController,
                      decoration: InputDecoration(
                        hintText: "conform password",
                      ),
                    ),
                  ),
                  SizedBox(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "SignIn",
                        style: kSmallTextStyle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
  // logi Bottom Sheet //
  

  loginSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
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
            children: [
              Padding(  
                padding: EdgeInsets.symmetric(horizontal: 140),
                child: Divider(
                  thickness: 4,
                  color: constantColors.whiteColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(hintText: "Enter your Name"),
                  controller: userNameTextController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: passwordTextController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Text("sign"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
