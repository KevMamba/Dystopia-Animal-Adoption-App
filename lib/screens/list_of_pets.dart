import 'package:dystopia_flutter_app/widgets/custom_scaffold.dart';
import 'package:dystopia_flutter_app/widgets/pet_list_card.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dystopia_flutter_app/widgets/helper_buttons.dart';

class ListScreen extends StatefulWidget {
  @override
  State createState() => new ListScreenState();
}

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

class ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    List<PetResults> _listElements = [
      PetResults(
          petPic: 'assets/images/dog-bg.jpg',
          petName: "Marley",
          petBreed: "Golden Retriever",
          petAge: "12 months"),
      PetResults(
        petPic: 'assets/images/pug.jpg',
        petName: "Polo",
        petBreed: "Pug",
        petAge: "1 year",
      ),
      PetResults(
        petPic: 'assets/images/lab.png',
        petName: "Woof",
        petBreed: "Labrador",
        petAge: "2 years",
      )
    ];
    return CustomScaffold(
      searchBar: true,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return _listElements[index];
        },
        itemCount: _listElements.length,
      ),
    );
  }
}
