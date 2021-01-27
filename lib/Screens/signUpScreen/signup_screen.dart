import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media_app/Services/authentication_services.dart';
import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:social_media_app/Utils/constant_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
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
            children: [
              CircleAvatar(
                backgroundColor: constantColors.redColor,
                radius: 80,
              ),
              const SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  style: kSmallTextStyle,
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: "FullName",
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  style: kSmallTextStyle,
                  obscureText: true,
                  controller: conformPasswordController,
                  decoration: const InputDecoration(
                    hintText: "Confrom password",
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              FloatingActionButton(
                onPressed: () {
                  if (emailController.text.isNotEmpty) {
                    context.read(authentication).createUserWithEmail(
                        emailController.text, passwordController.text);
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
