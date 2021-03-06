import 'package:custom_navigation_bar/custom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/Services/firebase_storage_services.dart';
import 'package:social_media_app/Utils/colors_utils.dart';

final homePageHelpers = ChangeNotifierProvider<HomePageHelpers>((ref) {
  return HomePageHelpers();
});

class HomePageHelpers with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();
  Widget bottomNavBar(int index, PageController pageController, BuildContext context) {
    return CustomNavigationBar(
      currentIndex: index,
      bubbleCurve: Curves.bounceIn,
      scaleCurve: Curves.decelerate,
      selectedColor: Colors.blueAccent,
      unSelectedColor: Colors.white54,
      strokeColor: constantColors.blueColor,
      scaleFactor: 0.5,
      iconSize: 30.0,
      onTap: (val) {
        index = val;
        pageController.jumpToPage(val);
        notifyListeners();
      },
      backgroundColor: Color(0xff040307),
      items: [
        CustomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.message_outlined),
        ),
        CustomNavigationBarItem(
          icon: CircleAvatar(
            backgroundImage: NetworkImage(
              context.read(firebaseStorageServices).getInitUserImage!,
            ),
            backgroundColor: constantColors.transperant,
            radius: 35.0,
          ),
        ),
      ],
    );
  }
}
