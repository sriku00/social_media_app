import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:social_media_app/Screens/splash_screen.dart';

import 'package:social_media_app/Theme/my_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme().myTheme(),
      debugShowCheckedModeBanner: false,
      title: "The Socail Media",
      home: SplashScreen(),
    );
  }
}
