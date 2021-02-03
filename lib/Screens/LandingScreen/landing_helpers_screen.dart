// signIN Bottom sheet

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

import 'package:social_media_app/Screens/LandingScreen/landing_utils_screen.dart';
import 'package:social_media_app/Screens/signUpScreen/signup_screen.dart';
import 'package:social_media_app/Services/firebase_storage_services.dart';

import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:social_media_app/Utils/constant_styles.dart';

// ignore: always_specify_types
final landingHelpers = ChangeNotifierProvider<LandingHelpersScreen>((ref) {
  return LandingHelpersScreen();
});

class LandingHelpersScreen extends ChangeNotifier {
  ConstantColors constantColors = ConstantColors();

// password less sign in widget

  Widget passwordLessSignIn(BuildContext context) => SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      // ignore: always_specify_types
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("allUsers").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children:
                  snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
                return ListTile(
                  trailing: IconButton(
                    onPressed: () {
                      //Todo:
                    },
                    icon: Icon(
                      FontAwesomeIcons.trash,
                      color: constantColors.redColor,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(documentSnapshot.data()["userImage"]),
                  ),
                  subtitle: Text(
                    documentSnapshot.data()["useremail"],
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    documentSnapshot.data()["username"],
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
            );
          }
        },
      ));

  // user Avataro bottom sheet

  userAvatarSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (
          context,
        ) {
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text(
                  "Select Profile Image",
                  style: kSmallTextStyle.copyWith(color: Colors.blueAccent),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 20,
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    color: Colors.black,
                    onPressed: () {
                      context
                          .read(landingUtilsScreen)
                          .pickUserAvatar(context, ImageSource.gallery)
                          .whenComplete(() {
                        Navigator.pop(context);
                        userAvatarShowSheet(context);
                      });
                    },
                    child: Center(
                      child: Text(
                        "Select from Gallery",
                        style: kSmallTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 20,
                  child: FlatButton(
                    color: Colors.black,
                    onPressed: () {
                      context
                          .read(landingUtilsScreen)
                          .pickUserAvatar(context, ImageSource.camera);
                    },
                    child: Center(
                      child: Text(
                        "Select from Camera",
                        style: kSmallTextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        });
  }
// userAvatar preview

  userAvatarShowSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (
          context,
        ) {
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: Divider(
                    color: constantColors.greyColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: constantColors.transperant,
                  backgroundImage:
                      FileImage(context.read(landingUtilsScreen).getUserAvatar),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  color: Colors.blueAccent,
                  child: Text(
                    "Continue with pic",
                    style: kSmallTextStyle.copyWith(fontSize: 16),
                  ),
                  onPressed: () {
                    context
                        .read(firebaseStorageServices)
                        .uploadUserAvatar(context)
                        .whenComplete(() {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: SignUpScreen(
                                context: context,
                              ),
                              type: PageTransitionType.bottomToTop));
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        });
  }
}
