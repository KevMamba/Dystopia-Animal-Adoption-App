import 'package:dystopia_flutter_app/widgets/pet_list_card.dart';
import 'package:flutter/cupertino.dart';

class SavedModel {
  static List<PetResults> favorites = [];

  static void add(PetResults item)
  {
    if(!favorites.contains(item))
      favorites.add(item);
    print(favorites);
  }

  static void remove(PetResults item)
  {
    favorites.remove(item);
    print(favorites);
  }
}