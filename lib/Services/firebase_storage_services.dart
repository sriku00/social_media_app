import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:social_media_app/Services/authentication_services.dart';
import 'package:social_media_app/Services/image_picker_services.dart';

final firebaseStorageSErvices =
    ChangeNotifierProvider<FirebaseStorageServices>((ref) {
  return FirebaseStorageServices();
});

class FirebaseStorageServices extends ChangeNotifier {
  UploadTask imageUploadTask;

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
}
