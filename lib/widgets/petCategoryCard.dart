import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class petCategory extends StatelessWidget {
  final String emoji;
  final String name;
  final Function pressButton;
  const petCategory({
    Key key,
    this.emoji,
    this.name,
    this.pressButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: pressButton,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(emoji, style: TextStyle(fontSize: 50.0)),
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 15.0)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}