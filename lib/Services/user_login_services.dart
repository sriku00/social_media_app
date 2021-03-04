import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/Utils/constant_styles.dart';

final userLoginServices = ChangeNotifierProvider<UserLoginServices>((ref) {
  return UserLoginServices();
});

class UserLoginServices extends ChangeNotifier {
  // user login info Storage Widget
  ConstantColors _constantColors = ConstantColors();
  Widget passwordLessSign(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: _constantColors.blueColor,
                ),
              );
            } else {
              return ListView(
                physics: BouncingScrollPhysics(),
                children:
                    snapshot.data!.docs.map((DocumentSnapshot documentSnapshot) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          NetworkImage(documentSnapshot.data()!["userImage"]),
                    ),
                    title: Text(
                      documentSnapshot.data()!["userName"],
                      style: kSmallTextStyle,
                    ),
                    subtitle: Text(
                      documentSnapshot.data()!["userEmail"],
                      style: kSmallTextStyle.copyWith(fontSize: 12),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.trash,
                        color: _constantColors.redColor,
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          },
        ),
      );
}
