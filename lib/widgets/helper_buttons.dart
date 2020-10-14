import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  @override
  FavoriteButtonState createState() => new FavoriteButtonState();
}

class FavoriteButtonState extends State<FavoriteButton> {
  bool liked = false;

  favPressed() {
    setState(() {
      liked = !liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        liked ? Icons.favorite : Icons.favorite_border,
        color: liked ? Colors.redAccent : Colors.grey,
        size: 30,
      ),
      onTap: () => favPressed(),
    );
  }
}

Widget filterCategory(String filter) {
  return Container(
    margin: EdgeInsets.all(8.0),
    width: 90.0,
    child: Material(
      type: MaterialType.card,
      borderRadius: BorderRadius.circular(20),
      child: Center(
        child: Text(
          filter,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
        ),
      ),
    ),
  );
}
