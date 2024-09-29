import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_auth/home.dart';
import 'package:project_auth/service/database.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signInWithGoole(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken,
    );
    UserCredential result = await firebaseAuth.signInWithCredential(credential);
    User? userDetials = result.user;

    Map<String, dynamic> userInfoMap = {
      "email": userDetials!.email,
      "name": userDetials.displayName,
      "imgUrl": userDetials.photoURL,
      "id": userDetials.uid,
    };

    await DatabaseMethods().addUser(userDetials.uid, userInfoMap).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    });
  }
}
