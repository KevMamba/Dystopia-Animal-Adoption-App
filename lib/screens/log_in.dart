import 'package:dystopia_flutter_app/screens/sign_up_form.dart';

import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme.dart';
import '../widgets/sign_in_helpers/layout.dart';
import '../widgets/sign_in_helpers/signup_or_login.dart';
import '../widgets/sign_in_helpers/social_signin.dart';
import '../widgets/bottom_navigation.dart';

class LoginScreen extends StatelessWidget {
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
                  colors: kSignUpColors,
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
                    /*  Image.asset(
                      'assets/images/Dystopia_logo_png.png',
                      filterQuality: FilterQuality.high,
                      height: 100,
                      width: 121,
                    ),*/
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    SigninFields(),
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

class SigninFields extends StatefulWidget {
  SigninFields({Key key}) : super(key: key);

  @override
  _SigninFieldsState createState() => _SigninFieldsState();
}

class _SigninFieldsState extends State<SigninFields> {
  /*
  final TextEditingController _emailController = TextEditingController();
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

  Commented lines will be implemented later with the help of validators.
*/
  bool _rememberMe = false;

  _displaySignUpForm() {
    PlatformPageRoute.pageRoute(
      widget: SignUpForm(),
      fullScreen: false,
      fromRoot: true,
      context: context,
    );
  }

  _gotoHomePage() {
    PlatformPageRoute.pageRoute(
      widget: BottomNavigation(),
      fullScreen: true,
      fromRoot: true,
      context: context,
    );
  }

  Container _buildLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 25.0,
      ),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () => _gotoHomePage(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
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
                checkColor: Color(0xFFb0abbf),
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
            // focusNode: _passwordFocusNode,
            // controller: _passwordController,
            autocorrect: false,
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
            //focusNode: _emailFocusNode,
            //controller: _emailController,
            //textInputAction: TextInputAction.next,
            autocorrect: false,
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
    List<Widget> _buildChildren() {
      return [
        _buildEmail(),
        SizedBox(
          height: 30.0,
        ),
        _buildPassword(),
        _buildForgotPassButton(),
        _buildRememberMe(),
        _buildLoginButton(),
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
          height: 10,
          thickness: 2,
        ),
        SizedBox(
          height: 10.0,
        ),
        Center(
          child: SignUpOrIn(
            description: 'Don\'t have an Account? ',
            highlighted: 'Sign Up!',
            action: () => _displaySignUpForm(),
          ),
        )
      ];
    }

    return Column(
      children: _buildChildren(),
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }
}
