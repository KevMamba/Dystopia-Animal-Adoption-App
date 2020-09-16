import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  GestureDetector _buildSignUp() {
    return GestureDetector(
      onTap: () => print('SIGN UP BUTTON PRESSED'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Color(0xFFb0abbf),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildSocialSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_facebookSignIn(), _googleSignIn()],
    );
  }

  GestureDetector _googleSignIn() {
    return GestureDetector(
      onTap: () => debugPrint("Google!"),
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              )
            ],
            image: DecorationImage(
                image: AssetImage(
              'assets/images/google-logo.png',
            ))),
      ),
    );
  }

  GestureDetector _facebookSignIn() {
    return GestureDetector(
      onTap: () => debugPrint("FACEBOOK!"),
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xFF4267B2),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              )
            ],
            image: DecorationImage(
                image: AssetImage(
              'assets/images/facebook-logo.png',
            ))),
      ),
    );
  }

  Container _buildLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 25.0,
      ),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () => debugPrint("LOG IN BUTTON PRESSED"),
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFFb0abbf),
            fontFamily: 'OpenSans',
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Container _buildRememberMe() {
    return Container(
        height: 20.0,
        child: Row(
          children: <Widget>[
            Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.white,
              ),
              child: Checkbox(
                value: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value;
                  });
                },
                checkColor: Colors.green,
                activeColor: Colors.white,
              ),
            ),
            Text(
              'Remember Me',
              style: kLabelStyle,
            )
          ],
        ));
  }

  Container _buildForgotPassButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        child: Text(
          "Forgot Password?",
          style: kLabelStyle,
        ),
        onPressed: () => debugPrint("FORGOT PASSWORD BUTTON PRESSED!"),
      ),
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
                      'Sign In',
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
                    _buildEmail(),
                    SizedBox(
                      height: 30.0,
                    ),
                    _buildPassword(),
                    _buildForgotPassButton(),
                    _buildRememberMe(),
                    _buildLoginButton(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '- OR -',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Sign in with',
                          style: kLabelStyle,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildSocialSignIn(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildSignUp()
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
