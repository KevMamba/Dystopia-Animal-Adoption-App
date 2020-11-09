import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';
import 'package:dystopia_flutter_app/theme.dart';

class GUFA_2 extends StatefulWidget {
  @override
  _GUFA_2State createState() => _GUFA_2State();
}

enum Pets { Dogs, Cats, Birds, Others }
Pets _character;

enum Gender { Male, Female }
Gender _gender;

class _GUFA_2State extends State<GUFA_2> {
  String name;
  bool checkedValue = false;
  bool isHomeTrained = false;
  bool isVaccinated = false;
  bool isNeutered = false;

  Widget buildTextFields(String text, String hint) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Text(
          text,
          style: TextStyle(
            wordSpacing: 3,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        TextField(
          keyboardType: TextInputType.text,
          textAlign: TextAlign.left,
          onChanged: (value) {
            name = value;
          },
          decoration: kTextFieldDecoration.copyWith(hintText: hint),
        ),
      ],
    );
  }

  Widget buildNumberTextFields(String text, String hint) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Text(
          text,
          style: TextStyle(
            wordSpacing: 3,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        TextField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.left,
          onChanged: (value) {
            name = value;
          },
          decoration: kTextFieldDecoration.copyWith(hintText: hint),
        ),
      ],
    );
  }

  Widget buildPetType() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Type',
          style: TextStyle(
            wordSpacing: 3,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListTile(
          title: const Text(
            'Dog 🐶',
            style: TextStyle(
              wordSpacing: 3,
              fontSize: 25,
            ),
          ),
          leading: Radio(
            activeColor: Color(0xffE09E45),
            value: Pets.Dogs,
            groupValue: _character,
            onChanged: (Pets value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text(
            'Cat 🐱',
            style: TextStyle(
              wordSpacing: 3,
              fontSize: 25,
            ),
          ),
          leading: Radio(
            activeColor: Color(0xffE09E45),
            value: Pets.Cats,
            groupValue: _character,
            onChanged: (Pets value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text(
            'Bird 🦜',
            style: TextStyle(
              wordSpacing: 3,
              fontSize: 25,
            ),
          ),
          leading: Radio(
            activeColor: Color(0xffE09E45),
            value: Pets.Birds,
            groupValue: _character,
            onChanged: (Pets value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text(
            'Others  🐹 🐰🦖',
            style: TextStyle(
              wordSpacing: 3,
              fontSize: 25,
            ),
          ),
          leading: Radio(
            activeColor: Color(0xffE09E45),
            value: Pets.Others,
            groupValue: _character,
            onChanged: (Pets value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget buildGender() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Gender',
          style: TextStyle(
            wordSpacing: 3,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListTile(
          title: const Text(
            'Male ♂',
            style: TextStyle(
              wordSpacing: 3,
              fontSize: 25,
            ),
          ),
          leading: Radio(
            activeColor: Color(0xffE09E45),
            value: Gender.Male,
            groupValue: _gender,
            onChanged: (Gender value) {
              setState(() {
                _gender = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text(
            'Female ♀',
            style: TextStyle(
              wordSpacing: 3,
              fontSize: 25,
            ),
          ),
          leading: Radio(
            activeColor: Color(0xffE09E45),
            value: Gender.Female,
            groupValue: _gender,
            onChanged: (Gender value) {
              setState(() {
                _gender = value;
              });
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(414, 896),
      allowFontScaling: true,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE09E45),
        centerTitle: true,
        title: ImageIcon(
          AssetImage(
            'assets/images/Dystopia_logo_png.png',
          ),
          size: 75,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(25.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'Pet Details',
                  style: TextStyle(
                    wordSpacing: 3,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                buildPetType(),
                buildTextFields(
                  'Name',
                  'Please enter your pet\'s name',
                ),
                buildNumberTextFields(
                  'Age',
                  'Please enter your pet\'s age in years',
                ),
                buildGender(),
                buildTextFields(
                  'Breed',
                  'Please enter your pet\'s breed',
                ),
                SizedBox(
                  height: 25.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        'Home trained?',
                        style: TextStyle(
                          wordSpacing: 3,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Switch(
                        value: isHomeTrained,
                        onChanged: (value) {
                          setState(() {
                            isHomeTrained = value;
                            print(isHomeTrained);
                          });
                        },
                        activeTrackColor: Colors.amber,
                        activeColor: Color(0xffE09E45),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        'Vaccinated?',
                        style: TextStyle(
                          wordSpacing: 3,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Switch(
                        value: isVaccinated,
                        onChanged: (value) {
                          setState(() {
                            isVaccinated = value;
                            print(isVaccinated);
                          });
                        },
                        activeTrackColor: Colors.amber,
                        activeColor: Color(0xffE09E45),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        'Neutered?',
                        style: TextStyle(
                          wordSpacing: 3,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Switch(
                        value: isNeutered,
                        onChanged: (value) {
                          setState(() {
                            isNeutered = value;
                            print(isNeutered);
                          });
                        },
                        activeTrackColor: Colors.amber,
                        activeColor: Color(0xffE09E45),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Color(0xffE09E45),
                  child: Icon(Icons.navigate_next),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
