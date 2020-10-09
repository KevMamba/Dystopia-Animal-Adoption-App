import 'package:dystopia_flutter_app/screens/pet_results.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dystopia_flutter_app/widgets/favorite_button.dart';

class PetResults extends StatelessWidget {
  final String petPic;
  final String petName;
  final String petBreed;
  final String petAge;
  final VoidCallback onTap;

  const PetResults({
    Key key,
    this.petPic,
    this.petName,
    this.petBreed,
    this.petAge,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return InkWell(
        onTap: () {
          PlatformPageRoute.pageRoute(
            widget: PetResultScreen(),
            context: context,
            fromRoot: false,
            fullScreen: false,
          );
        },
        child: IgnorePointer(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Container(
                margin: EdgeInsets.all(20.0),
                height: 360,
                child: Column(children: <Widget>[
                  Container(child: Image.asset(petPic, fit: BoxFit.contain)),
                  Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Color(0xFF8a8c5d),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          )),
                      child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        "$petName",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        "$petBreed",
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 18,
                                        ),
                                      )
                                    ]),
                                Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      FavoriteButton(),
                                      Text("$petAge\n",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ))
                                    ])
                              ])))
                ])),
            //
          ),
        ));
  }
}
