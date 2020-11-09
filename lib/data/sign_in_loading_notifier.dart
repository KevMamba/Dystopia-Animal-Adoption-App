import 'dart:async';

import 'package:dystopia_flutter_app/services/auth.dart';
import 'package:dystopia_flutter_app/services/firestore_service.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignInLoadingNotifier {
  final Auth auth;
  final ValueNotifier<bool> isLoading;
  SignInLoadingNotifier({@required this.auth, @required this.isLoading});
  final instance = FirestoreService.instance;
  Future<User> signInWithGoogle() async {
    User user = await _signIn(auth.signInWithGoogle);
    await instance.addUser(username: user.displayName, photo: user.photoUrl);
    return user;
  }

  Future<User> signInWithFacebook() async {
    User user = await _signIn(auth.siginWithFacebook);

    await instance.addUser(username: user.displayName, photo: user.photoUrl);
    return user;
  }

  Future<User> signInAnonymously() async => await _signIn(
        auth.signInAnonymously,
      );

  Future<User> _signIn(Future<User> Function() signInMethod) async {
    try {
      isLoading.value = true;
      return await signInMethod();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }
}
