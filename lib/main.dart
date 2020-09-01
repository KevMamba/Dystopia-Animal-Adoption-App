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
      home: HomePage(),
    );
  }
}

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
