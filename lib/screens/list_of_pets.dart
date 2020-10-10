import 'package:dystopia_flutter_app/widgets/pet_list_card.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  // creating a stateful widget
  @override
  State createState() => new ListScreenState(); // creating the state
}

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

class ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildAppBar(),
          _buildPetResults(),
        ],
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      pinned: true,
      collapsedHeight: 150,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(
            opacity: 0,
          ),
          Text(
            "Dogs",
            style: TextStyle(
              fontSize: 50,
            ),
          ),
        ],
      ),
    );
  }

  SliverList _buildPetResults() {
    List<PetResults> listElements = [
      PetResults(
          petPic: 'assets/images/dog-bg.jpg',
          petName: "Marley",
          petBreed: "Golden Retriever",
          petAge: "12 months"),
      PetResults(
          petPic: 'assets/images/dog-bg.jpg',
          petName: "Polo",
          petBreed: "Beagle",
          petAge: "3 months")
    ];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return listElements[index];
        },
        childCount: 2,
      ),
    );
  }
}
