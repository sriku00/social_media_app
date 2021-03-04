import 'package:flutter/material.dart';
import 'package:social_media_app/Screens/HomeScreen/FeedPageScreen/feed_page_helpers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.read(feedPageHelpers).feedPageAppBarWidget(context) as PreferredSizeWidget?,
      drawer: Drawer(),
      body: context.read(feedPageHelpers).feedPageBody(context),
    );
  }
}
