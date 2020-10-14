import 'package:dystopia_flutter_app/widgets/pet_list_card.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:material_floating_search_bar/material_floating_search_bar.dart';

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
  var value;
  bool isExpanded = false;

  Widget buildFloatingSearchBar() {
    final controller = FloatingSearchBarController();

    return FloatingSearchBar(
      controller: controller,
      borderRadius: BorderRadius.circular(20),
      margins: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      elevation: 10,
      clearQueryOnClose: true,
      hint: 'Enter Location',
      iconColor: Colors.grey[400],
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOutCubic,
      physics: const BouncingScrollPhysics(),
      axisAlignment: 0.0,
      openAxisAlignment: 0.0,
      maxWidth: 600,
      actions: [
        FloatingSearchBarAction(
          showIfOpened: true,
          child: Tooltip(
            message: "Filters",
            child: IconButton(
              splashRadius: 20,
              icon: Icon(
                Icons.tune,
                color: Colors.grey[400],
                semanticLabel: "Filters",
              ),
              onPressed: () {},
            ),
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      //progress: model.isLoading,
      debounceDelay: const Duration(milliseconds: 500),
      //onQueryChanged: model.onQueryChanged,
      transition: CircularFloatingSearchBarTransition(),
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
      //body: buildBody(),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<PetResults> _listElements = [
      PetResults(
          petPic: 'assets/images/dog-bg.jpg',
          petName: "Marley",
          petBreed: "Golden Retriever",
          petAge: "12 months"),
      /* PetResults(
          petPic: 'assets/images/dog-bg.jpg',
          petName: "Polo",
          petBreed: "Beagle",
          petAge: "3 months"),
      PetResults(
          petPic: 'assets/images/dog-bg.jpg',
          petName: "Marley",
          petBreed: "Golden Retriever",
          petAge: "12 months"),*/
    ];
    return Scaffold(
      backgroundColor: Color(0xFFb9815d),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Opacity(
                      opacity: 0.0,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: Material(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return _listElements[index];
                    },
                    itemCount: _listElements.length,
                  ),
                ),
              ),
            ],
          ),
          buildFloatingSearchBar(),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
