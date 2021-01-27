import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

// ignore: always_specify_types
final userDataServices = ChangeNotifierProvider<UserDataServices>((ref) {
  return UserDataServices();
});

class UserDataServices extends ChangeNotifier {
 

  // password less signin
 
}
