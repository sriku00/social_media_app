import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:social_media_app/Screens/LandingScreen/landing_utils_screen.dart';

// ignore: always_specify_types
final firebaseStorageServices =
    ChangeNotifierProvider<FirebaseStorageServices>((ref) {
  return FirebaseStorageServices();
});

class FirebaseStorageServices extends ChangeNotifier {
  UploadTask userImageUploadTask;

  Future uploadUserAvatar(BuildContext context) async {
    try {
      Reference imageReference = FirebaseStorage.instance.ref().child(
          "userProfileAvatar/${context.read(landingUtilsScreen).getUserAvatar.path}/${TimeOfDay.now()}");

      userImageUploadTask = imageReference
          .putFile(context.read(landingUtilsScreen).getUserAvatar);
      await userImageUploadTask.whenComplete(() {
        print("print => image uploaded");
      });
      imageReference.getDownloadURL().then((url) {
        context.read(landingUtilsScreen).userAvatarUrl = url.toString();
        print(
            "user avatar url => ${context.read(landingUtilsScreen).userAvatarUrl}");
      });
    } catch (e) {
      print(e.message);
    }

    notifyListeners();
  }
}
