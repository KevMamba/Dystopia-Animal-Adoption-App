import 'package:dystopia_flutter_app/widgets/custom_scaffold.dart';
import 'package:dystopia_flutter_app/widgets/pet_list_card.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

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
    ];
    return CustomScaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return _listElements[index];
        },
        itemCount: _listElements.length,
      ),
    );
  }
}
