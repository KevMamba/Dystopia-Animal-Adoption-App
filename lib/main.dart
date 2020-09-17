import 'package:animated_splash/animated_splash.dart';
import 'package:dystopia_flutter_app/screens/log_in.dart';
import 'package:flutter/material.dart';

void main() => runApp(DystopiaApp());

class DystopiaApp extends StatefulWidget {
  @override
  _DystopiaAppState createState() => _DystopiaAppState();
}

class _DystopiaAppState extends State<DystopiaApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplash(
        imagePath: 'assets/images/Dystopia_logo_png.png',
        home: LoginScreen(),
        duration: 2500,
        type: AnimatedSplashType.StaticDuration,
      ),
      // Landing Page will be passed here.
      // https://pub.dev/packages/animated_splash
      // will be handy later.
    );
  }
}
/*
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/Dystopia_logo_png.png'),
      ),
    );
  }
}
*/
