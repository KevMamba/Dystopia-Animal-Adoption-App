import 'package:dystopia_flutter_app/screens/sign_in.dart';
import 'package:dystopia_flutter_app/services/auth.dart';
import 'package:dystopia_flutter_app/widgets/bottom_navigation.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;

            if (user == null) {
              return SignInPage.create(context);
            } else {
              return Provider<User>.value(
                value: user,
                child: BottomNavigation(),
              );
            }
          } else {
            return Scaffold(
              body: Center(
                child: PlatFormProgressIndicator(
                  r: 40,
                ),
              ),
            );
          }
        });
  }
}
