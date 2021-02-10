import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/Utils/colors_utils.dart';

final landingWidgets = ChangeNotifierProvider<LandingWidgets>((ref) {
  return LandingWidgets();
});

class LandingWidgets extends ChangeNotifier {
  final ConstantColors constantColors = ConstantColors();

  // the image Body widget

  Widget bodyImgae(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login.png"),
        ),
      ),
    );
  } 

  // TagLIne Widget

  Widget tagLineText() => Positioned(
    child: null,
  );
}
