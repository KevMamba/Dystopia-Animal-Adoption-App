import 'package:flutter/material.dart';

class SocialSignin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GestureDetector _facebookSignIn() {
      return GestureDetector(
        onTap: () => debugPrint("FACEBOOK!"),
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
        onTap: () => debugPrint("Google!"),
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
