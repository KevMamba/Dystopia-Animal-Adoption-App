import 'package:animated_splash/animated_splash.dart';
import 'package:dystopia_flutter_app/screens/landing_page.dart';
import 'package:dystopia_flutter_app/theme.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(DystopiaApp());
}

class DystopiaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_) => Auth(),
      child: MaterialApp(
        theme: kLightTheme,
        debugShowCheckedModeBanner: false,
        home: AnimatedSplash(
          imagePath: 'assets/images/Dystopia_logo_png.png',
          home: LandingPage(),
          duration: 2500,
          type: AnimatedSplashType.StaticDuration,
        ),
        // Landing Page will be passed here.
        // https://pub.dev/packages/animated_splash
        // will be handy later.
      ),
    );
  }
}
