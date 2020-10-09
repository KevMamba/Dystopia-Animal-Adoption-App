import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class User {
  final String uid;
  final String photoUrl;
  final String displayName;
  User(
      {@required this.uid,
      @required this.photoUrl,
      @required this.displayName});
}

abstract class AuthBase {
  Future<User> currentUser();
  Future<User> signInAnonymously();

  Stream<User> get onAuthStateChanged;

  Future<void> signOut();
  Future<User> signInWithGoogle();
  Future<User> siginWithFacebook();

  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> createUserWithEmailIdAndPassword(String email, String password);

  Future<void> resetPassword(String email);
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  // type helper
  User _userFromFirebase(auth.User user) => (user != null)
      ? User(
          uid: user.uid, displayName: user.displayName, photoUrl: user.photoURL)
      : null;

  // custom stream of users
  Stream<User> get onAuthStateChanged =>
      _firebaseAuth.authStateChanges().map(_userFromFirebase);

  @override
  Future<User> currentUser() async =>
      _userFromFirebase(_firebaseAuth.currentUser);

  @override
  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final authResult = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        return _userFromFirebase(authResult.user);
      } else {
        throw FirebaseAuthException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing google auth token',
        );
      }
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  @override
  Future<User> siginWithFacebook() async {
    final facebookAuth = FacebookAuth.instance;
    final facebookAccount =
        await facebookAuth.login(permissions: ['email', 'public_profile']);

    if (facebookAccount.accessToken != null) {
      final OAuthCredential credential =
          FacebookAuthProvider.credential(facebookAccount.accessToken.token);
      final auth.User user =
          (await _firebaseAuth.signInWithCredential(credential)).user;
      return _userFromFirebase(user);
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  @override
  // ignore: missing_return
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    if (authResult.user.emailVerified == true) {
      return _userFromFirebase(authResult.user);
    }
  }

  @override
  // ignore: missing_return
  Future<User> createUserWithEmailIdAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    try {
      await authResult.user.sendEmailVerification();
      return _userFromFirebase(authResult.user);
    } catch (e) {
      print("An error occured while trying to send email verification");
      print(e.message);
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signOut() async {
    print("It's here");
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
