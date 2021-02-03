import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/Services/firebase_storage_services.dart';

final landingUtilsScreen = ChangeNotifierProvider<LandingUtilsScreen>((ref) {
  return LandingUtilsScreen();
});

class LandingUtilsScreen extends ChangeNotifier {
  final picker = ImagePicker();

  File userAvatar;
  File get getUserAvatar => userAvatar;
  String userAvatarUrl;
  String get getUserAvatarUrl => userAvatarUrl;

  // function for image picking
  Future pickUserAvatar(BuildContext context, ImageSource source) async {
    final pickerUserAvatar = await picker.getImage(source: source);
    try {
      pickerUserAvatar == null
          ? print("select Image")
          : userAvatar = File(pickerUserAvatar.path);
      print(userAvatar.path);
      userAvatar != null
          ? context.read(firebaseStorageServices).uploadUserAvatar(context)
          : print('Image UPload Error');
    } catch (e) {
      print(e.message);
    }

    notifyListeners();
  }
}
