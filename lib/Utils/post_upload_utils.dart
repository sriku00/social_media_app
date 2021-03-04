import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:social_media_app/Services/image_picker_services.dart';
import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:social_media_app/Utils/constant_styles.dart';

final postUploadUtils = ChangeNotifierProvider<PostUploadUtils>((ref) {
  return PostUploadUtils();
});

class PostUploadUtils with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();

  File? uploadPostImage;

  File? get getuploadPostImage => uploadPostImage;

  String? uploadPostImageUrl;
  String? get getuploadPostImageUrl => uploadPostImageUrl;

  // user post upload funtion to firestore & could firestore

  Future uploadUserAvatar(BuildContext context) async {

    Reference postReference = FirebaseStorage.instance.ref().child(
        "userProfileAvatar/${context.read(imagePickerServices).getUserAvatar!.path}/${TimeOfDay.now()}");
    postUploadTask = postReference.putFile();

   / await postUploadTask.whenComplete(() {
      print("image => user Image Uploaded");
    });
    postReference.getDownloadURL().then((url) {
      context.read(imagePickerServices).userAvatarUrl = url.toString();

      print(
          "the user profile url => ${context.read(imagePickerServices).userAvatarUrl}");
    });
    notifyListeners();
  }

// image picker funtion
  final picker = ImagePicker();
  Future userPostPicker(BuildContext context, ImageSource imageSource) async {
    final uploadUserPostImage = await picker.getImage(source: imageSource);

    uploadUserPostImage == null
        ? print("picker userAvatar")
        : uploadPostImage = File(uploadUserPostImage.path);
    print(uploadPostImage!.path);

    uploadUserPostImage != null
        ? userPostPreviewSheet(context)
        : print("image Upload Error");

    notifyListeners();
  }

// user post  upload  preview   bottom sheet widget here------

  userPostPreviewSheet(BuildContext context) => showModalBottomSheet(
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
                backgroundImage: FileImage(),
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
                      // post upload reselection
                      selectPostUploadImage(context);
                    },
                    child: Text(
                      "reselect",
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
                      // --------Todo: upload to the x firebase fierstore
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
  // Image Upload Widget

  selectPostUploadImage(BuildContext context) => showModalBottomSheet(
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
                  userPostPicker(context, ImageSource.camera).whenComplete(() {
                    Navigator.pop(context);
                    userPostPreviewSheet(context);
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
                  userPostPicker(context, ImageSource.gallery).whenComplete(() {
                    Navigator.pop(context);
                    userPostPreviewSheet(context);
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
}
