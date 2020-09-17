import 'package:dystopia_flutter_app/widgets/layout.dart';
import 'package:dystopia_flutter_app/widgets/signup_or_login.dart';
import 'package:dystopia_flutter_app/widgets/social_signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme.dart';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFe3e5dd),
                    Color(0xFFd5d8cc),
                    Color(0xFFc7cbbb),
                    Color(0xFFbabfab),
                  ],
                  stops: [
                    0.1,
                    0.4,
                    0.7,
                    0.9,
                  ],
                ),
              ),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    SignUpFields(), //.create() later,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SignUpFields extends StatefulWidget {
  @override
  _SignUpFieldsState createState() => _SignUpFieldsState();
}

class _SignUpFieldsState extends State<SignUpFields> {
  /* final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  // implemented later with the help of validators.
  */

  Column _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your email',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Column _buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your password',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Container _buildRegister() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 25.0,
      ),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () => debugPrint("REGISTER BUTTON PRESSED"),
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.white,
        child: Text(
          'REGISTER',
          style: TextStyle(
            color: Color(0xFF565165),
            fontFamily: 'OpenSans',
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildChildren() {
      return [
        _buildEmail(),
        SizedBox(
          height: 30.0,
        ),
        _buildPassword(),
        SizedBox(
          height: 20.0,
        ),
        _buildRegister(),
        Layout(),
        SizedBox(
          height: 10.0,
        ),
        SocialSignin(),
        SizedBox(
          height: 10.0,
        ),
        Divider(
          color: Colors.grey,
          height: 10.0,
          thickness: 2,
        ),
        SizedBox(height: 15),
        SignUpOrIn(
          description: 'Already have an Account?',
          highlighted: 'Login!',
          action: () => Navigator.of(context).pop(false),
        )
      ];
    }

    return Column(
      children: _buildChildren(),
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }
}
