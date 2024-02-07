import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
        if (isValidEmail(user!.email ?? '')) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('${user.displayName} signed in successfully')));
          return user;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Please Sign in with your college email-id')));
          await googleSignIn.signOut();
          return null;
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.code)));
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.code)));
        }
      } catch (e) {}
    }
  }

  static bool isValidEmail(String email) {
    final RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@srmist\.edu\.in$');
    return regex.hasMatch(email);
  }
}
