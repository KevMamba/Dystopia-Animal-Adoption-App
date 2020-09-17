abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class FieldValidators {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();

  final String invalidEmailErrorText = 'Email cannot be blank';
  final String invalidPasswordErrorText = 'Password cannot be blank ';
}
