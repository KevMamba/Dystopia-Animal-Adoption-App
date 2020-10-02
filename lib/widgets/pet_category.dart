import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PetCategory extends StatelessWidget {
  final String image;
  final String name;
  final Function pressButton;
  const PetCategory({
    Key key,
    this.image,
    this.name,
    this.pressButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 10,
          )
        ]),
        child: Material(
          child: InkWell(
            onTap: pressButton,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFb9815d),
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(fontSize: 18.0)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
