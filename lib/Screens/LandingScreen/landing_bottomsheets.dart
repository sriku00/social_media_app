import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:social_media_app/Utils/constant_styles.dart';

final landingBottomSheets = ChangeNotifierProvider<LandingBottomSheets>((ref) {
  return LandingBottomSheets();
});

class LandingBottomSheets extends ChangeNotifier {
  final ConstantColors constantColors = ConstantColors();
  // email and password signUp sheet
  emailBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        elevation: 15,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: constantColors.darkColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 160),
                    child: Divider(
                      thickness: 5,
                      color: constantColors.greyColor,
                    ),
                  ),
                  SizedBox(),
                  TextFormField(),
                  TextFormField(),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField()
                ],
              ),
            ),
          );
        });
  }
}
