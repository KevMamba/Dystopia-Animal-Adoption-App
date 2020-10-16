import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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

class filterCategory extends StatefulWidget{
  filterCategory(this.filter,this.toggle);
  final String filter;
  final bool toggle;

  @override
  filterCategoryState createState() => new filterCategoryState();
}

class filterCategoryState extends State<filterCategory>
{
  bool hasBeenPressed = false;

  filterPressed(){

    if(widget.toggle)
    {
      setState(() {
        hasBeenPressed = !hasBeenPressed;
      });
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      child:
      Container(
        margin: EdgeInsets.all(8.0),
        width: 90.0,
        child: Material(
          type: MaterialType.card,
          color: hasBeenPressed? Color(0xff875433) : Color(0xffaaF5E0C3),
          borderRadius: BorderRadius.circular(20),
          child: Center(
            child: Text(
              widget.filter,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: hasBeenPressed? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
      onTap: () => filterPressed(),
    );
  }
}