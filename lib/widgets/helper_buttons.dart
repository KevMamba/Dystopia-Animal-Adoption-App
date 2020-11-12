import 'package:dystopia_flutter_app/widgets/pet_list_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dystopia_flutter_app/data/saved_page_model.dart';

class FavoriteButton extends StatefulWidget {

  FavoriteButton({@required this.item});
  final PetResults item;

  @override
  FavoriteButtonState createState() => new FavoriteButtonState();
}

class FavoriteButtonState extends State<FavoriteButton> {

  PetResults get item => widget.item;

  favPressed() {
    setState(() {
      if(item.liked)
        {
          SavedModel.remove(item);
        }
      else
        {
          SavedModel.add(item);
        }

      item.liked = !item.liked;
    });
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Icon(
        item.liked ? Icons.favorite : Icons.favorite_border,
        color: item.liked ? Colors.redAccent : Colors.grey,
        size: 30,
      ),
      onTap: () => favPressed(),
    );
  }
}

class FilterCategory extends StatefulWidget {
  FilterCategory(this.filter, this.toggle);
  final String filter;
  final bool toggle;

  @override
  FilterCategoryState createState() => new FilterCategoryState();
}

class FilterCategoryState extends State<FilterCategory> {
  bool hasBeenPressed = false;

  filterPressed() {
    if (widget.toggle) {
      setState(() {
        hasBeenPressed = !hasBeenPressed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(8.0),
        width: 90.0,
        child: Material(
          type: MaterialType.card,
          color: hasBeenPressed ? Color(0xff875433) : Color(0xffaaF5E0C3),
          borderRadius: BorderRadius.circular(20),
          child: Center(
            child: Text(
              widget.filter,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: hasBeenPressed ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
      onTap: () => filterPressed(),
    );
  }
}
