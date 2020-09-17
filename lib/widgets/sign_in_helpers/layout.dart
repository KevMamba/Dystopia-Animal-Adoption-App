import 'package:flutter/material.dart';

import '../theme.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Divider(
                color: Colors.grey,
                height: 10,
                indent: 0,
                thickness: 2,
              ),
            ),
            Text(
              ' OR ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.grey,
                height: 10,
                thickness: 2,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Sign in with',
          style: kLabelStyle,
        )
      ],
    );
  }
}
