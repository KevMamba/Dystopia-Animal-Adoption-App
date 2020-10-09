import 'package:dystopia_flutter_app/data/sign_in_loading_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../platform_widgets.dart';

class SocialSignin extends StatelessWidget {
  final SignInLoadingNotifier block;

  const SocialSignin({Key key, this.block}) : super(key: key);

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await block.signInWithGoogle();
    } catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      await block.signInWithFacebook();
    } catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    }
  }

  void _showSignInError(BuildContext context, FirebaseAuthException exception) {
    PlatFormExceptionAlertDialog(title: 'Sign In Failed', exception: exception);
  }

  @override
  Widget build(BuildContext context) {
    GestureDetector _facebookSignIn() {
      return GestureDetector(
        onTap: () => _signInWithFacebook(context),
        child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFF4267B2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                )
              ],
              image: DecorationImage(
                  image: AssetImage(
                'assets/images/facebook-logo.png',
              ))),
        ),
      );
    }

    GestureDetector _googleSignIn() {
      return GestureDetector(
        onTap: () => _signInWithGoogle(context),
        child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                )
              ],
              image: DecorationImage(
                  image: AssetImage(
                'assets/images/google-logo.png',
              ))),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_facebookSignIn(), _googleSignIn()],
    );
  }
}
