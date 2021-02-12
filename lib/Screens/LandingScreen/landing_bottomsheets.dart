import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_media_app/Services/authentication_services.dart';
import 'package:social_media_app/Utils/colors_utils.dart';
import 'package:social_media_app/Utils/constant_styles.dart';

final landingBottomSheets = ChangeNotifierProvider<LandingBottomSheets>((ref) {
  return LandingBottomSheets();
});

class LandingBottomSheets extends ChangeNotifier {
  final ConstantColors constantColors = ConstantColors();
  // email and password signUp sheet
  sigInAuthBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        elevation: 15,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: constantColors.darkColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: SignInForm(
                constantColors: constantColors,
                context: context,
              ),
            ),
          );
        });
  }

  // Login Authentication BottomSheet

  loginAuthBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        elevation: 15,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: constantColors.darkColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: LoginForm(),
            ),
          );
        });
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 160),
              child: Divider(thickness: 5, color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(),
            SizedBox(
              height: 20,
            ),
            TextFormField(),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
              clipBehavior: Clip.none,
              onPressed: () {
                //     Todo: implement the FirebaseAuthLogin fuctionality;
              },
              child: Text(
                "LogIn",
                style: kSmallTextStyle.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm(
      {Key key, @required this.constantColors, @required BuildContext context})
      : super(key: key);

  final ConstantColors constantColors;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 160),
              child: Divider(
                thickness: 5,
                color: constantColors.greyColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundColor: constantColors.redColor,
              radius: 70,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(),
            SizedBox(
              height: 20,
            ),
            TextFormField(),
            SizedBox(
              height: 20,
            ),
            TextFormField(),
            SizedBox(
              height: 20,
            ),
            TextFormField(),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: constantColors.yellowColor),
              clipBehavior: Clip.none,
              onPressed: () {
                //     Todo: implement the FirebaseAuthsigiN fuctionality;
              },
              child: Text(
                "SigIn",
                style: kSmallTextStyle.copyWith(color: Colors.black),
              ),
            )
          ],
        ),
      ],
    );
  }
}
