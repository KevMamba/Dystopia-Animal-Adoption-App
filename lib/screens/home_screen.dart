import 'package:dystopia_flutter_app/theme.dart';
import 'package:dystopia_flutter_app/widgets/custom_app_bar.dart';
import 'package:dystopia_flutter_app/widgets/pet_category.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        CustomAppBar(),
        _buildHeader(),
        _buildSubHeading(),
        _buildPetCategory(),
      ],
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
            color: Colors.grey[400], //Color(0xFFbabfab),
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
        child: Text("Categories"),
      ),
    );
  }

  SliverGrid _buildPetCategory() {
    List<PetCategory> gridElements = [
      PetCategory(name: "Dogs", emoji: "🐶", pressButton: () {}),
      PetCategory(name: "Cats", emoji: "🐈", pressButton: () {}),
      PetCategory(name: "Hamsters", emoji: "🐹", pressButton: () {}),
      PetCategory(name: "Others", emoji: "🐾", pressButton: () {})
    ];
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return gridElements[index];
        },
        childCount: 4,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 5,
      ),
    );
  }
}
