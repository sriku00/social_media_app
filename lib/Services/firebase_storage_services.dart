import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:social_media_app/Services/authentication_services.dart';
import 'package:social_media_app/Services/image_picker_services.dart';

final firebaseStorageServices =
    ChangeNotifierProvider<FirebaseStorageServices>((ref) {
  return FirebaseStorageServices();
});

class FirebaseStorageServices extends ChangeNotifier {
  UploadTask imageUploadTask;

  String initUserEmail;
  String initUserName;
  String initUserImage;

  String get getInitUserName => initUserName;
  String get getInitUserEmail => initUserEmail;
  String get getInitUserImage => initUserImage;

  // user Avatar uPload function here

  Future uploadUserAvatar(BuildContext context) async {
    Reference imageReference = FirebaseStorage.instance.ref().child(
        "userProfileAvatar/${context.read(imagePickerServices).getUserAvatar.path}/${TimeOfDay.now()}");
    imageUploadTask =
        imageReference.putFile(context.read(imagePickerServices).getUserAvatar);

    await imageUploadTask.whenComplete(() {
      print("image => user Image Uploaded");
    });
    imageReference.getDownloadURL().then((url) {
      context.read(imagePickerServices).userAvatarUrl = url.toString();

      print(
          "the user profile url => ${context.read(imagePickerServices).userAvatarUrl}");
    });
    notifyListeners();
  }

  Future uploadUserData(BuildContext context, dynamic data) async {
    try {
      return FirebaseFirestore.instance
          .collection("users")
          .doc(context.read(authentication).getUserUid)
          .set(data);
    } catch (e) {}
  }

  Future initUserData(BuildContext context) async {
    try {
      return await FirebaseFirestore.instance
          .collection("users")
          .doc(context.read(authentication).getUserUid)
          .get()
          .then((doc) {
        print("fetching user data");
        initUserEmail = doc.data()["userEmail"];
        initUserName = doc.data()["userName"];
        initUserImage = doc.data()["userImage"];
        print(initUserEmail);
        print(initUserName);
        print(initUserImage);

        notifyListeners();
      });
    } catch (e) {
      e.message();
    }
  }
}
