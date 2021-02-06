
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
final landingHelpers = ChangeNotifierProvider<LandingHelpers>((ref) {
    return LandingHelpers();
});
class LandingHelpers extends ChangeNotifier{

}