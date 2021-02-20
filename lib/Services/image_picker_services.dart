import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import "package:image_picker/image_picker.dart";
import 'package:social_media_app/Screens/LandingScreen/landing_bottomsheets.dart';

final imagePickerServices = ChangeNotifierProvider<ImagePickerServices>((ref) {
  return ImagePickerServices();
});

class ImagePickerServices extends ChangeNotifier {
  final picker = ImagePicker();
  File userAvatar;
  File get getUserAvatar => userAvatar;
  String userAvatarUrl;
  String get getUserAvatarUrl => userAvatarUrl;

  Future pickUserAvatar(BuildContext context, ImageSource imageSource) async {
    final pickuserAvater = await picker.getImage(source: imageSource);

    pickuserAvater == null
        ? print("picker userAvatar")
        : userAvatar = File(pickuserAvater.path);
    print(userAvatar.path);

    userAvatar != null
        ? context.read(landingBottomSheets).userAvatarPreviewSheet(context)
        : print("image Upload Error");

    notifyListeners();
  }
}
