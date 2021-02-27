import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/Services/image_picker_services.dart';
import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:social_media_app/Utils/constant_styles.dart';

final postUploadUtils = ChangeNotifierProvider<PostUploadUtils>((ref) {
  return PostUploadUtils();
});

class PostUploadUtils extends ChangeNotifier {
  ConstantColors constantColors = ConstantColors();

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
                  context
                      .read(imagePickerServices)
                      .pickUserAvatar(context, ImageSource.camera);
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
                  context
                      .read(imagePickerServices)
                      .pickUserAvatar(context, ImageSource.gallery);
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
