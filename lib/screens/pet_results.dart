import 'package:flutter/material.dart';
import 'package:dystopia_flutter_app/widgets/searchbox.dart';
import 'package:dystopia_flutter_app/widgets//favorite_button.dart';
import 'package:dystopia_flutter_app/widgets/filter_category.dart';


class PetResultScreen extends StatefulWidget {
  @override
  State createState() => new PetResultScreenState();
}

class PetResultScreenState extends State<PetResultScreen> {
  Padding OwnerBox() {
    return Padding(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.png'),
                radius: 22.0,
              ),
              SizedBox(width: 10.0),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "Aleena Dox \n",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  TextSpan(
                    text: "Owner",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ]),
              )
            ]),
            Row(children: <Widget>[
              IconButton(
                  icon: Icon(Icons.chat_bubble_outline_rounded),
                  color: Colors.black,
                  onPressed: () => {}),
              IconButton(
                  icon: Icon(Icons.phone),
                  color: Colors.black,
                  onPressed: () => {}),
            ])
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xffbabfb8),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          //alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                      height: myHeight * 0.4,
                      child: Hero(
                          tag: "results", //change later
                          child: Image(
                            image: AssetImage('assets/images/dog-bg.jpg'),
                            fit: BoxFit.cover,
                          ))),
                  //SizedBox(height: 30.0),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.zero, topRight: Radius.zero, bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                        color: Color(0xff8a8f88),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Polo",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold)),
                              Text("3 months",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Golden Retriever",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  )),
                              Row(children: <Widget>[
                                Icon(Icons.location_on),
                                Text("Bangalore",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ))
                              ])
                            ],
                          )
                        ],
                      )

                  ),
                  Container(
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(10),
                        children: <Widget>[
                          filterCategory("Female"),
                          filterCategory("Pug"),
                          filterCategory("3 months"),
                        ],
                      )
                  ),
                  OwnerBox(),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et odio pellentesque diam volutpat commodo sed egestas. Ac turpis egestas maecenas pharetra convallis posuere morbi leo urna.",
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 1.5,
                        ),
                        //overflow: TextOverflow.ellipsis,
                      )
                  )
                ]),
                Container(
                    child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                Icons.arrow_back_ios,
                                size: 24.0,
                                color: Colors.white,
                              ),
                              FavoriteButton(),
                            ]))),
              ],
            )));
  }
}
