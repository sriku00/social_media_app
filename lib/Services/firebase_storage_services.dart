import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

// ignore: always_specify_types
final firebaseStorageServices =
    ChangeNotifierProvider<FirebaseStorageServices>((ref) {
  return FirebaseStorageServices();
});

class FirebaseStorageServices extends ChangeNotifier {


  


}
