import 'package:flutter/material.dart';

class SignUpOrIn extends StatelessWidget {
  final String description;
  final String highlighted;
  final VoidCallback action;
  const SignUpOrIn({Key key, this.description, this.highlighted, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action(),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: highlighted,
              style: TextStyle(
                color: Color(0xFF565165),
                decoration: TextDecoration.underline,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
