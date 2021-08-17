import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Email Verification
  Future emailVerification() async {
    User user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  //register with email and password.
  Future registerWithEmailAndPassword(var emailText, var passwordText) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: emailText, password: passwordText);
      emailVerification();
      print("registerWithEmailAndPassword main register ho gaya hai.");
      return userCredential;
    } catch (e) {
      if (e == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return "ok";
    }
  }

  //Sign In With Email And Password.
  Future loginWithEmailAndPassword(var emailText, var passwordText) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailText, password: passwordText);
      print("login main signin ho gaya hai.");
      return userCredential;
    } catch (e) {
      if (e == 'user-not-found') {
        print('No user found for that email.');
      } else if (e == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }
}
