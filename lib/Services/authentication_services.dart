import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authentication = ChangeNotifierProvider<Authentication>((ref) {
  return Authentication();
});

class Authentication extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  String? userUid;
  String? get getUserUid => userUid;

  // creating Users with email and password

  Future createUserWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        final User user = userCredential.user!;
        userUid = user.uid;

        print(" Created User uid => $userUid");
      }
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e.toString());
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    notifyListeners();
  }

  // Logingin user

  Future loginUser(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        final User user = userCredential.user!;
        userUid = user.uid;
        // ignore: avoid_print
        print(userUid.toString());
      }
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e.toString());
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    notifyListeners();
  }

  // SignOut User
  Future signOut(BuildContext context) async {
    await _firebaseAuth.signOut();
  }

  // Google SignIN

  Future googleSignIn(BuildContext context) async {
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final OAuthCredential googleAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(googleAuthCredential);

    if (userCredential.user != null) {
      final User user = userCredential.user!;

      userUid = user.uid;
      // ignore: avoid_print
      print(" Google User => $userUid");
    }
  }

  // google SignOut
  Future googleSignOut(BuildContext context) async {
    await _googleSignIn.signOut();
  }
}
