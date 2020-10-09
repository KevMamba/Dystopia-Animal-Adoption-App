import 'package:dystopia_flutter_app/data/email_sign_in_model.dart';
import 'package:dystopia_flutter_app/services/auth.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import '../widgets/sign_in_helpers/layout.dart';
import '../widgets/sign_in_helpers/signup_or_login.dart';
import '../widgets/sign_in_helpers/social_signin.dart';
import 'package:password_strength/password_strength.dart';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                      SignUpFields.create(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpFields extends StatefulWidget {
  final EmailSignInChangeModel model;

  SignUpFields({@required this.model});
  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<EmailSignInChangeModel>(
      create: (context) => EmailSignInChangeModel(auth: auth),
      child: Consumer<EmailSignInChangeModel>(
        builder: (context, model, _) => SignUpFields(model: model),
      ),
    );
  }

  @override
  _SignUpFieldsState createState() => _SignUpFieldsState();
}

class _SignUpFieldsState extends State<SignUpFields> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  EmailSignInChangeModel get model => widget.model;

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    try {
      model.formType = EmailSignInFormType.Register;
      await model.submit();
      PlatformAlertDialog(
        title: "Email Verification",
        cancelActionText: "Okay",
        content:
            "We've sent a link on your email. Once verified, tap on Login! to continue.",
      ).show(context);
    } catch (e) {
      PlatFormExceptionAlertDialog(
        title: 'Sign Up Failed',
        exception: e,
      ).show(context);
    }
  }

  void _onEmailEditingComplete() {
    final newFocus = model.emailValidator.isValid(model.email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  final myController = TextEditingController();
  Text passwordStrength(String password) {
    double strength = estimatePasswordStrength(password);

    if (strength < 0.3) {
      return (Text(
        'Password Strength: Weak',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ));
    } else if (strength < 0.7) {
      return (Text(
        'Password Strength: Medium',
        style: TextStyle(
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
        ),
      ));
    } else {
      return (Text(
        'Password Strength: Strong',
        style: TextStyle(
          color: Colors.greenAccent[400],
          fontWeight: FontWeight.bold,
        ),
      ));
    }
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
            focusNode: _emailFocusNode,
            controller: _emailController,
            textInputAction: TextInputAction.next,
            onEditingComplete: () => _onEmailEditingComplete(),
            onChanged: model.updateEmail,
            autocorrect: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your email',
              hintStyle: kHintTextStyle,
              errorText:
                  model.showErrorText ? model.invalidEmailErrorText : null,
              enabled: model.isLoading == false,
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
            controller: myController,
            obscureText: true,
            focusNode: _passwordFocusNode,
            autocorrect: false,
            maxLines: 1,
            onEditingComplete: _submit,
            onChanged: model.updatePassword,
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
              errorText: model.showPasswordErrorText
                  ? model.invalidPasswordErrorText
                  : null,
              enabled: model.isLoading == false,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPasswordStrength() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        passwordStrength(myController.text)
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
        onPressed: model.canSubmit ? _submit : null,
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
        _buildPasswordStrength(),
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
        Center(
          child: SignUpOrIn(
            description: 'Already have an Account? ',
            highlighted: 'Login!',
            action: () {
              model.toggleFormType();
              _emailController.clear();
              _passwordController.clear();
              Navigator.of(context).pop(false);
            },
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
