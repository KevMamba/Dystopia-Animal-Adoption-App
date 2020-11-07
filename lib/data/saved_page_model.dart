import 'package:dystopia_flutter_app/widgets/pet_list_card.dart';
import 'package:flutter/cupertino.dart';

class SavedModel extends ChangeNotifier{
  List favorites = [];

  void add(PetResults item)
  {
    favorites.add(item);
    notifyListeners();
  }

  void remove(PetResults item)
  {
    favorites.remove(item);
    notifyListeners();
  }
}