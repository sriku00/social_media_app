import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authentication = ChangeNotifierProvider<Authentication>((ref) {
  return Authentication();
});

class Authentication extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  String userUid;
  String get getUserUid => userUid;

  // creating Users with email and password

  Future createUserWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        User user = userCredential.user;
        userUid = user.uid;
        print(userUid.toString());
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  // Logingin user

  Future loginUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        User user = userCredential.user;
        userUid = user.uid;
        print(userUid.toString());
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  // SignOut User
  Future signOut() async {
    await _firebaseAuth.signOut();
  }

  // Google SignIN

  Future googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final GoogleAuthCredential googleAuthCredential =
        GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(googleAuthCredential);

    if (userCredential.user != null) {
      final User user = userCredential.user;

      userUid = user.uid;
      print(" Google User => $userUid");
    }
  }

  // google SignOut
  Future googleSignOut() async {
    await _googleSignIn.signOut();
  }
}
