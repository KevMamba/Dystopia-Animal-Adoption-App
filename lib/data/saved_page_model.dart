import 'package:dystopia_flutter_app/widgets/pet_list_card.dart';

class SavedModel {
  static List<PetResults> favorites = [];
  static List<String> names = [];
  static void add(PetResults item) {
    if (check(names, item.petName) == false) {
      favorites.add(item);
      addDetails(item);
    }
  }

  static void remove(PetResults item) {
    favorites.remove(item);
  }

  static addDetails(PetResults item) {
    names.add(item.petName);
  }

  static bool check(List list, String petName) {
    return list.contains(petName);
  }
}
