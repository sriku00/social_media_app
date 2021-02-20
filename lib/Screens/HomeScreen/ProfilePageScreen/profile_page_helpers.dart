import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:social_media_app/Utils/constant_styles.dart';

final profilePageHelpers = ChangeNotifierProvider<ProfilePageHelpers>((ref) {
  return ProfilePageHelpers();
});

class ProfilePageHelpers extends ChangeNotifier {
  ConstantColors constantColors = ConstantColors();
  // header widget

  Widget profilepageHeader(BuildContext context, dynamic snapshot) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.26,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 220,
            width: 200,
            decoration: BoxDecoration(),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: constantColors.transperant,
                      backgroundImage:
                          NetworkImage(snapshot.data.data()["userImage"]),
                      radius: 58,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 9.0),
                  child: Text(
                    snapshot.data.data()["userName"],
                    style: kSmallTextStyle.copyWith(
                        color: constantColors.whiteColor, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        EvaIcons.emailOutline,
                        color: constantColors.yellowColor,
                        size: 16,
                      ),
                      Text(
                        snapshot.data.data()["userEmail"],
                        style: kSmallTextStyle.copyWith(
                            color: constantColors.whiteColor, fontSize: 12),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: constantColors.darkColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          children: [
                            Text(
                              "0",
                              style: kSmallTextStyle.copyWith(
                                  fontSize: 28,
                                  color: constantColors.whiteColor),
                            ),
                            Text(
                              "Followers",
                              style: kSmallTextStyle.copyWith(
                                  fontSize: 12,
                                  color: constantColors.whiteColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 12),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: constantColors.darkColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          children: [
                            Text(
                              "0",
                              style: kSmallTextStyle.copyWith(
                                  fontSize: 28,
                                  color: constantColors.whiteColor),
                            ),
                            Text(
                              "Following",
                              style: kSmallTextStyle.copyWith(
                                  fontSize: 12,
                                  color: constantColors.whiteColor),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: constantColors.darkColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      children: [
                        Text(
                          "0",
                          style: kSmallTextStyle.copyWith(
                              fontSize: 28, color: constantColors.whiteColor),
                        ),
                        Text(
                          "Postes",
                          style: kSmallTextStyle.copyWith(
                              fontSize: 12, color: constantColors.whiteColor),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
// Widget Divider

  Widget dividerWidget(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 25,
        width: 250,
        child: Divider(
          thickness: 2,
          color: constantColors.whiteColor,
        ),
      ),
    );
  }
  // profile page Middle part Widget

  Widget middleProfile(BuildContext context, DocumentSnapshot snapshot) {
    return Column(
      children: [
        
      ],
    );
  }
}
