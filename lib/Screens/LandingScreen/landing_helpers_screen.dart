// signIN Bottom sheet

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/Services/authentication_services.dart';
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
}
