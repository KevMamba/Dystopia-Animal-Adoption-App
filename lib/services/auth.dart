import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        throw PlatformException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing google auth token',
        );
      }
    } else {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  @override
  Future<User> siginWithFacebook() async {
    final facebookAuth = FacebookAuth.instance;
    final facebookAccount = await facebookAuth.login();

    if (facebookAccount != null) {
      final AccessToken _accessToken = await facebookAuth.isLogged;
      if (_accessToken != null) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(_accessToken.token);
        final auth.User user =
            (await _firebaseAuth.signInWithCredential(credential)).user;
        return _userFromFirebase(user);
      } else {
        throw PlatformException(
          code: 'ERROR_MISSING_FACEBOOK_ACCESS_TOKEN',
          message: 'Missing Facebook access token',
        );
      }
    } else {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<User> createUserWithEmailIdAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
    print("It's here");
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
