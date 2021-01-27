import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social_media_app/Services/authentication_services.dart';
import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:social_media_app/Utils/constant_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class LogInScreen extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // ignore: prefer_const_literals_to_create_immutables
              stops: [0.5, 0.9],
              colors: [
                constantColors.darkColor,
                constantColors.blueGreyColor,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  style: kSmallTextStyle,
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Email",
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
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "password",
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              FloatingActionButton(
                onPressed: () {
                  if (emailController.text.isNotEmpty) {
                    context.read(authentication).loginUser(
                        emailController.text, passwordController.text).whenComplete((){

                        //  Navigator.pushReplacement(context, PageTransition(child: , type: ))
                        });
                  } else {
                    warning(context, "Please enter the vaild email");
                  }
                },
                backgroundColor: constantColors.redColor,
                child: Icon(
                  FontAwesomeIcons.check,
                  color: constantColors.whiteColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

warning(BuildContext context, String warning) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              warning,
              style: kSmallTextStyle,
            ),
          ),
        );
      });
}
