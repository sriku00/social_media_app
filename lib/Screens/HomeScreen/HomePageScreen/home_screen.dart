import 'package:flutter/material.dart';
import 'package:social_media_app/Screens/HomeScreen/ChatPageScreen/chat_page.dart';
import 'package:social_media_app/Screens/HomeScreen/FeedPageScreen/feed_page.dart';
import 'package:social_media_app/Screens/HomeScreen/ProfilePageScreen/profile_page.dart';
import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ConstantColors constantColors = ConstantColors();

  final PageController _pageController = PageController();
  int pageIndex = 0;
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

        bottomNavigationBar: CustomNavigationBar(),

        
        );
  }
}
