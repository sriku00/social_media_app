import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: RichText(
          text: TextSpan(text: "The", children: [
            TextSpan(
                text: " Socail",
                style: TextStyle(color: Theme.of(context).accentColor))
          ]),
        ),
      ),
    );
  }
}
