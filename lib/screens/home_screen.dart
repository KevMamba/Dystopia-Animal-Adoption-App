/*import 'package:dystopia_flutter_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/petCategoryCard.dart';


class HomePage extends StatefulWidget {
  // creating a stateful widget
  @override
  State createState() => new HomePageState(); // creating the state
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      /*bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xffbfe0bf),
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),*/
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height*.45,
              decoration: BoxDecoration(
                color: Color(0xFFbabfab),
                gradient: new LinearGradient(colors: [Color(0xFFbabfab), Color(0xffE2D7C5)]),
              ),
            ),
            SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/userIcon.png',
                                  height: 40.0,
                                  width: 40.0,
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                        SizedBox(height:30),
                        Text(
                          "Welcome Back,\n XYZ", //RichText?
                          style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 30.0)),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 30),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F5F7),
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(3, 3),
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.16),
                                  spreadRadius: -2,
                                )
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search, color: Colors.black),
                                  labelText: "Search for something!",
                                  labelStyle: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.grey,
                                  )
                              ),
                            )
                        ),
                        Expanded(
                            child: GridView.count(
                                crossAxisCount: 2,
                                childAspectRatio: .90,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                children:<Widget>[
                                  petCategory(
                                      name: "Dogs",
                                      emoji: "🐶",
                                      pressButton: () {}
                                  ),
                                  petCategory(
                                      name: "Cats",
                                      emoji: "🐱",
                                      pressButton: () {}
                                  ),
                                  petCategory(
                                      name: "Hamsters",
                                      emoji: "🐹",
                                      pressButton: () {}
                                  ),
                                  petCategory(
                                      name: "Others",
                                      emoji: "🐾",
                                      pressButton: () {}
                                  )
                                ]
                            )

                        )
                      ],
                    )
                )
            )
          ],
        )
    );
  }
}
