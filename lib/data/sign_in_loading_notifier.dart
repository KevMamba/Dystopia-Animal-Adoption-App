import 'dart:async';

import 'package:dystopia_flutter_app/services/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignInLoadingNotifier {
  final Auth auth;
  final ValueNotifier<bool> isLoading;
  SignInLoadingNotifier({@required this.auth, @required this.isLoading});

  Future<User> signInWithGoogle() async => _signIn(auth.signInWithGoogle);

  Future<User> signInWithFacebook() async => _signIn(auth.siginWithFacebook);

  Future<User> signInAnonymously() async => _signIn(
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
