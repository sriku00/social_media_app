import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authentication = ChangeNotifierProvider<Authentication>((ref) {
  return Authentication();
});

class Authentication extends ChangeNotifier {

  // Email signIn 
 
}
