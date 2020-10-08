import 'package:dystopia_flutter_app/services/auth.dart';
import 'package:dystopia_flutter_app/services/validators.dart';
import 'package:flutter/foundation.dart';

enum EmailSignInFormType { SignIn, Register }

class EmailSignInChangeModel with FieldValidators, ChangeNotifier {
  String email;
  String password;
  EmailSignInFormType formType;
  bool isLoading;
  bool submitted;
  final Auth auth;
  EmailSignInChangeModel(
      {this.email = '',
      this.password = '',
      this.formType = EmailSignInFormType.SignIn,
      this.isLoading = false,
      this.submitted = false,
      @required this.auth});

  void updateWith(
      {String email,
      String password,
      EmailSignInFormType formType,
      bool isLoading,
      bool submitted}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.formType = formType ?? this.formType;
    this.isLoading = isLoading ?? this.isLoading;
    this.submitted = submitted ?? this.submitted;
    notifyListeners();
  }

  void updateEmail(String email) => updateWith(email: email);
  void updatePassword(String password) => updateWith(password: password);

  String get primaryButtonText {
    return formType == EmailSignInFormType.SignIn
        ? 'Sign In'
        : 'Create An Account';
  }

  String get secondaryButtonText => formType == EmailSignInFormType.SignIn
      ? 'First Time? Register'
      : 'Have an Account? Sign In';

  bool get showErrorText => submitted && !emailValidator.isValid(email);

  bool get showPasswordErrorText =>
      submitted && !passwordValidator.isValid(password);

  bool get canSubmit =>
      emailValidator.isValid(email) &&
      passwordValidator.isValid(password) &&
      !isLoading;

  void toggleFormType() {
    final formtype = this.formType == EmailSignInFormType.SignIn
        ? EmailSignInFormType.Register
        : EmailSignInFormType.SignIn;
    updateWith(
      email: '',
      password: '',
      submitted: false,
      formType: formtype,
      isLoading: false,
    );
  }

  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);
    print(formType);
    try {
      // introduce artificial delays to check if the sign-in form is disabled when an auth request is in progress
      // await Future.delayed(Duration(seconds: 3));
      if (this.formType == EmailSignInFormType.SignIn) {
        await auth.signInWithEmailAndPassword(this.email, this.password);
      } else {
        await auth.createUserWithEmailIdAndPassword(this.email, this.password);
      }
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }
}
