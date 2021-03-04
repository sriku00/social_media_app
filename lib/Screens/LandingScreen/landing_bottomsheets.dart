import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social_media_app/Screens/HomeScreen/HomePageScreen/home_screen.dart';

import 'package:social_media_app/Services/authentication_services.dart';
import 'package:social_media_app/Services/firebase_storage_services.dart';
import 'package:social_media_app/Services/image_picker_services.dart';
import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:social_media_app/Utils/constant_styles.dart';

final landingBottomSheets = ChangeNotifierProvider<LandingBottomSheets>((ref) {
  return LandingBottomSheets();
});

class LandingBottomSheets with ChangeNotifier {
  final ConstantColors constantColors = ConstantColors();

  // Image picker Bottom sheet
  imagePickerBottomSheet(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: constantColors.blueGreyColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                clipBehavior: Clip.none,
                onPressed: () {
                  context
                      .read(imagePickerServices)
                      .pickUserAvatar(context, ImageSource.camera)
                      .whenComplete(() {
                    Navigator.pop(context);
                    userAvatarPreviewSheet(context);
                  });
                },
                child: Text(
                  "Camera",
                  style: kSmallTextStyle.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.yellowAccent),
                clipBehavior: Clip.none,
                onPressed: () {
                  context
                      .read(imagePickerServices)
                      .pickUserAvatar(context, ImageSource.gallery)
                      .whenComplete(() {
                    Navigator.pop(context);
                    userAvatarPreviewSheet(context);
                  });
                },
                child: Text(
                  "Gallery",
                  style: kSmallTextStyle.copyWith(color: Colors.black),
                ),
              )
            ],
          ),
        );
      });

  // usesrAvatar preview BottomSheet

  userAvatarPreviewSheet(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: constantColors.blueGreyColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                backgroundColor: constantColors.transperant,
                backgroundImage:
                    FileImage(context.read(imagePickerServices).userAvatar),
                radius: 70,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                    clipBehavior: Clip.none,
                    onPressed: () {
                      imagePickerBottomSheet(context);
                    },
                    child: Text(
                      "back",
                      style: kSmallTextStyle.copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: Colors.yellowAccent),
                    clipBehavior: Clip.none,
                    onPressed: () {
                      context
                          .read(firebaseStorageServices)
                          .uploadUserAvatar(context);

                      sigInAuthBottomSheet(context);
                    },
                    child: Text(
                      "Confirm",
                      style: kSmallTextStyle.copyWith(color: Colors.black),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      });

  // Warning Bottom sheet

  warningBottomSheet(BuildContext context, String warning) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                warning,
                style: kSmallTextStyle,
              ),
            ),
            decoration: BoxDecoration(
                color: constantColors.transperant,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
          );
        });
  }

  // email and password signUp sheet
  sigInAuthBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        elevation: 15,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: constantColors.darkColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: SignInForm(
                constantColors: constantColors,
                context: context,
              ),
            ),
          );
        });
  }

  // Login Authentication BottomSheet

  loginAuthBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        elevation: 15,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: constantColors.darkColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: LoginForm(),
            ),
          );
        });
  }
}

// LoginForm Widget

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 160),
              child: Divider(thickness: 5, color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              style: kSmallTextStyle,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(
                  EvaIcons.email,
                  color: Colors.blueAccent,
                ),
              ).copyWith(
                focusColor: Colors.blueAccent,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    width: 4,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              style: kSmallTextStyle,
              textAlign: TextAlign.center,
              obscureText: true,
              decoration: InputDecoration(
                hintText: " password",
                prefixIcon: Icon(
                  EvaIcons.lock,
                  color: Colors.blueAccent,
                ),
              ).copyWith(
                focusColor: Colors.blueAccent,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    width: 4,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
              clipBehavior: Clip.none,
              onPressed: () {
                //     Todo: implement the FirebaseAuthLogin fuctionality;

                if (_emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  context
                      .read(authentication)
                      .loginUser(
                          _emailController.text, _passwordController.text)
                      .whenComplete(() {
                    context
                        .read(firebaseStorageServices)
                        .initUserData(context)
                        .whenComplete(() {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: HomeScreen(),
                              type: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 500)));
                    });
                  });
                } else {
                  context.read(landingBottomSheets).warningBottomSheet(
                      context, "Enter email & password correctly");
                }
              },
              child: Text(
                "LogIn",
                style: kSmallTextStyle.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ],
    );
  }
}

// SignINForm Sheet
class SignInForm extends StatelessWidget {
  const SignInForm(
      {Key key, @required this.constantColors, @required BuildContext context})
      : super(key: key);

  final ConstantColors constantColors;

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _confromPasswordController = TextEditingController();
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 160),
              child: Divider(
                thickness: 5,
                color: constantColors.greyColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundColor: constantColors.transperant,
              backgroundImage:
                  FileImage(context.read(imagePickerServices).userAvatar),
              radius: 70,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _nameController,
              style: kSmallTextStyle,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "UserName",
                prefixIcon: Icon(
                  EvaIcons.email,
                  color: constantColors.yellowColor,
                ),
              ).copyWith(
                focusColor: constantColors.yellowColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    width: 4,
                    color: constantColors.yellowColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              style: kSmallTextStyle,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(
                  EvaIcons.person,
                  color: constantColors.yellowColor,
                ),
              ).copyWith(
                focusColor: constantColors.yellowColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    width: 4,
                    color: constantColors.yellowColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              controller: _passwordController,
              style: kSmallTextStyle,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(
                  EvaIcons.lock,
                  color: constantColors.yellowColor,
                ),
              ).copyWith(
                focusColor: constantColors.yellowColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    width: 4,
                    color: constantColors.yellowColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              controller: _confromPasswordController,
              style: kSmallTextStyle,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: " re-Password",
                prefixIcon: Icon(
                  EvaIcons.lock,
                  color: constantColors.yellowColor,
                ),
              ).copyWith(
                focusColor: constantColors.yellowColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    width: 4,
                    color: constantColors.yellowColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: constantColors.yellowColor),
              clipBehavior: Clip.none,
              onPressed: () {
                //     Todo: implement the FirebaseAuthsigiN fuctionality;
                if (_emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty &&
                    _nameController.text.isNotEmpty) {
                  context
                      .read(authentication)
                      .createUserWithEmail(
                          _emailController.text, _passwordController.text)
                      .whenComplete(() {
                    // Todo : Navigation to homePage
                    // Todo: Upload user data to cloud fierstore

                    print("creating Collection/,,,,");
                    context
                        .read(firebaseStorageServices)
                        .uploadUserData(context, {
                      "userUid": context.read(authentication).getUserUid,
                      "userEmail": _emailController.text,
                      "userName": _nameController.text,
                      "userImage":
                          context.read(imagePickerServices).getUserAvatarUrl
                    });
                    print("creatin user Collecion done");
                    context.read(firebaseStorageServices).initUserData(context);
                  }).whenComplete(() {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: HomeScreen(),
                            type: PageTransitionType.bottomToTop));
                  });
                } else {
                  context.read(landingBottomSheets).warningBottomSheet(
                      context, "Enter email & password correctly");
                }
              },
              child: Text(
                "SigIn",
                style: kSmallTextStyle.copyWith(color: Colors.black),
              ),
            )
          ],
        ),
      ],
    );
  }
}
