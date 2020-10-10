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
      child: Icon(liked ? Icons.favorite : Icons.favorite_border,
          color: liked ? Colors.redAccent : Colors.grey),
      onTap: () => favPressed(),
    );
  }
}
