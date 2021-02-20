import 'package:flutter/material.dart';
import 'package:social_media_app/Screens/HomeScreen/ChatPageScreen/chat_page.dart';
import 'package:social_media_app/Screens/HomeScreen/FeedPageScreen/feed_page.dart';
import 'package:social_media_app/Screens/HomeScreen/HomePageScreen/homepage_helpers.dart';
import 'package:social_media_app/Screens/HomeScreen/ProfilePageScreen/profile_page.dart';
import 'package:social_media_app/Services/firebase_storage_services.dart';
import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ConstantColors constantColors = ConstantColors();

  final PageController _pageController = PageController();
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();

    context.read(firebaseStorageServices).initUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          FeedPage(),
          ChartPage(),
          ProfilePage(),
        ],
        onPageChanged: (page) {
          setState(() {
            pageIndex = page;
          });
        },
      ),
      bottomNavigationBar: context
          .read(homePageHelpers)
          .bottomNavBar(pageIndex, _pageController, context),
    );
  }
}
