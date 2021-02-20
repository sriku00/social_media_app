import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/Screens/HomeScreen/ProfilePageScreen/profile_page_helpers.dart';
import 'package:social_media_app/Services/authentication_services.dart';
import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:social_media_app/Utils/constant_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ConstantColors constantcolors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: constantcolors.blueGreyColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Todo; implement on press function Settings Drawer function
          },
          icon: Icon(
            EvaIcons.settingsOutline,
            color: Colors.blueAccent,
          ),
        ),
        title: RichText(
          text: TextSpan(
              text: "My",
              style: kSmallTextStyle.copyWith(fontSize: 20),
              children: [
                TextSpan(
                  text: "Profile",
                  style: kSmallTextStyle.copyWith(
                      color: Colors.blueAccent, fontSize: 20),
                )
              ]),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Todo; implement on press function logOut function
            },
            icon: Icon(
              EvaIcons.logOutOutline,
              color: Colors.blueAccent,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: constantcolors.blueGreyColor.withOpacity(0.6)),
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(context.read(authentication).getUserUid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: constantcolors.lightBlueColor,
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      context
                          .read(profilePageHelpers)
                          .profilepageHeader(context, snapshot),
                      context.read(profilePageHelpers).dividerWidget(context),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
