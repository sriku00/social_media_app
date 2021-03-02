import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:social_media_app/Utils/constant_styles.dart';
import 'package:social_media_app/Utils/post_upload_utils.dart';

final feedPageHelpers = ChangeNotifierProvider<FeedPageHelpers>((ref) {
  return FeedPageHelpers();
});

class FeedPageHelpers with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();
  // AppBar Wiget

  Widget feedPageAppBarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: constantColors.darkColor,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            //Todo: implement the   camera functionality
            context.read(postUploadUtils).selectPostUploadImage(context);
          },
          icon: Icon(
            Icons.camera_enhance_outlined,
            color: constantColors.yellowColor,
          ),
        )
      ],
      title: RichText(
        text: TextSpan(
            text: "Social",
            style: kSmallTextStyle.copyWith(fontSize: 20),
            children: [
              TextSpan(
                text: "Feed",
                style: kSmallTextStyle.copyWith(
                    color: Colors.blueAccent, fontSize: 20),
              )
            ]),
      ),
    );
  }

  // FEED page Body

  Widget feedPageBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
            color: constantColors.darkColor.withOpacity(0.6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            )),
      ),
    );
  }
}
