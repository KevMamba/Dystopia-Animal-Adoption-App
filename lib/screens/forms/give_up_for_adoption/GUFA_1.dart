import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:dystopia_flutter_app/theme.dart';

class GUFA extends StatefulWidget {
  @override
  GUFAState createState() => GUFAState();
}

class GUFAState extends State<GUFA> {
  String name;
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
                buildTextFields(
                  'Why do you need to rehome your pet?',
                  'Please enter your reason',
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  color: Color(0xffE09E45),
                  thickness: 1,
                ),
                buildTextFields(
                  'Name',
                  'Please enter your name',
                ),
                buildTextFields(
                  'Email',
                  'Please enter your email address',
                ),
                buildNumberTextFields(
                  'Mobile number',
                  'Please enter your mobile number',
                ),
                buildTextFields(
                  'Address',
                  'Please enter your home address',
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
