// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';

class Firebase_Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user.uid;
    } catch (e) {
      print(e);
    }
  }

  signUpWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user.uid;
    } catch (e) {
      print(e);
    }
  }

  signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
