import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final landingUtilsScreen = ChangeNotifierProvider<LandingUtilsScreen>((ref) {
  return LandingUtilsScreen();
});

class LandingUtilsScreen extends ChangeNotifier {
  final picker = ImagePicker();

  File userAvatar;
  File get getUserAvatar => userAvatar;
  String userAvatarUrl;
  String get getUserAVatarUrl => userAvatarUrl;

  // function for image picking
  Future pickUserAvatar(BuildContext context, ImageSource source) async {
    final pickerUserAvatar = await picker.getImage(source: source);
    pickerUserAvatar == null
        ? print("Select Image")
        : userAvatar = File(pickerUserAvatar.path);
    print(userAvatar.path);

  }
}
