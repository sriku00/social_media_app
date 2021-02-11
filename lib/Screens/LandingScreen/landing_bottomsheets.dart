import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final landingBottomSheets = ChangeNotifierProvider<LandingBottomSheets>((ref) {
  return LandingBottomSheets();
});

class LandingBottomSheets extends ChangeNotifier {
  // email and password signUp sheet
  emailBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container();
        });
  }

  
}
