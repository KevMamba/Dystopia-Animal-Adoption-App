import 'package:dystopia_flutter_app/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dystopia_flutter_app/widgets/pet_list_cards.dart';

//import 'package:material_floating_search_bar/material_floating_search_bar.dart';



class AdoptionResults extends StatefulWidget {
  // creating a stateful widget
  @override
  State createState() => new AdoptionResultsState(); // creating the state
}

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);


class AdoptionResultsState extends State<AdoptionResults> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            _buildHeader()];
        },
        body: Builder(builder: (BuildContext builder) {
          return CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: [
              //buildFloatingSearchBar(),
              _buildSubHeading(),
              _buildPetResults(),
              //_buildPetCategory(),
            ],
          );
        }),
      ),
    );
  }


  SliverToBoxAdapter _buildHeader() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(
          5,
        ),
        decoration: BoxDecoration(
            color: Color(0xFF8a8c5d), //Color(0xFFbabfab),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
        child: Container(
            margin: EdgeInsets.all(3),
            height: 115,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(text: "Hello", style: kLabelStyle),
                    TextSpan(
                        text: ' {User_Name}',
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                    TextSpan(
                      text: '! We found ',
                      style: kLabelStyle,
                    ),
                    TextSpan(
                        text: "{no_of_pets}",
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                    TextSpan(
                      text: " animals waiting to be adopted in your area.",
                      style: kLabelStyle,
                    )
                  ]),
                ),
              ],
            )),
      ),
    );
  }

  SliverToBoxAdapter _buildSubHeading() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Text("Results"),
      ),
    );
  }

  SliverList _buildPetResults() {
    List<PetResults> listElements = [
      PetResults(petPic: 'assets/images/dog-bg.jpg', petName: "Marley", petBreed: "Golden Retriever", petAge: "12 months", pressButton: () {}),
      PetResults(petPic: 'assets/images/dog-bg.jpg', petName: "Polo", petBreed: "Beagle", petAge: "3 months", pressButton: () {})
    ];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index){
          return listElements[index];
        },
        childCount: 2,
      ),

    );

  }
}