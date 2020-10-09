import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformPageRoute {
  final bool fullScreen;
  final bool fromRoot;
  final Widget widget;
  final BuildContext context;
  PlatformPageRoute(
      {@required this.fullScreen,
      @required this.widget,
      @required this.fromRoot,
      @required this.context});

  static Future<void> pageRoute(
      {bool fullScreen,
      Widget widget,
      BuildContext context,
      bool fromRoot}) async {
    return Future.microtask(() {
      if (Platform.isIOS) {
        return Navigator.of(context, rootNavigator: fromRoot)
            .push(CupertinoPageRoute<void>(
                builder: (context) {
                  return widget;
                },
                fullscreenDialog: fullScreen));
      } else {
        return Navigator.of(context, rootNavigator: fromRoot)
            .push(MaterialPageRoute<void>(
                builder: (context) {
                  return widget;
                },
                fullscreenDialog: fullScreen));
      }
    });
  }
}

abstract class PlatFormWidget extends StatelessWidget {
  Widget buildCuptertinoWidgets(BuildContext context);
  Widget buildMaterialWidgets(BuildContext context);
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return buildCuptertinoWidgets(context);
    } else {
      return buildMaterialWidgets(context);
    }
  }
}

class PlatformAlertDialog extends PlatFormWidget {
  final String title;
  final String content;
  final String cancelActionText;
  final String defaultActionText;

  final VoidCallback action;
  PlatformAlertDialog(
      {@required this.title,
      @required this.content,
      this.cancelActionText,
      this.action,
      this.defaultActionText})
      : assert(title != null),
        assert(content != null),
        assert(defaultActionText != null);

  Future<bool> show(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog<bool>(
            context: context,
            builder: (context) => this,
          )
        : await showDialog<bool>(
            context: context,
            builder: (context) => this,
            barrierDismissible:
                false, // cannot dismiss the alert dialog by tapping elsewhere on the screen
          );
  }

  @override
  Widget buildCuptertinoWidgets(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  @override
  Widget buildMaterialWidgets(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    final actions = <Widget>[];
    actions.add(PlatFormAlertDialogAction(
      child: Text(defaultActionText),
      onPressed: () {
        if (action != null) {
          action();
        }
        Navigator.of(context).pop();
      },
      isDestructive: true,
    ));
    if (cancelActionText != null) {
      actions.add(PlatFormAlertDialogAction(
        child: Text(cancelActionText),
        onPressed: () => Navigator.of(context).pop(true),
      ));
    }
    return actions;
  }
}

class PlatFormAlertDialogAction extends PlatFormWidget {
  final Widget child;
  final VoidCallback onPressed;
  final bool isDestructive;

  PlatFormAlertDialogAction({
    this.child,
    this.onPressed,
    this.isDestructive: false,
  });

  @override
  Widget buildCuptertinoWidgets(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
      isDestructiveAction: isDestructive,
    );
  }

  @override
  Widget buildMaterialWidgets(BuildContext context) {
    return FlatButton(
      child: child,
      onPressed: onPressed,
    );
  }
}

class PlatFormProgressIndicator extends PlatFormWidget {
  final double r;

  PlatFormProgressIndicator({this.r});
  @override
  Widget buildCuptertinoWidgets(BuildContext context) {
    return CupertinoActivityIndicator(
      radius: r,
    );
  }

  @override
  Widget buildMaterialWidgets(BuildContext context) {
    return CircularProgressIndicator();
  }
}

class PlatFormExceptionAlertDialog extends PlatformAlertDialog {
  final String title;
  final FirebaseAuthException exception;

  PlatFormExceptionAlertDialog({
    @required this.title,
    @required this.exception,
  }) : super(
          title: title,
          defaultActionText: 'Ok',
          content: _message(exception),
        );

  static String _message(FirebaseAuthException exception) {
    print("Sign in issue : $exception");
    if (exception.message == 'FIRFirestoreErrorDomain') {
      if (exception.code == 'Error 7') {
        return 'Missing or insufficient permissions';
      }
    }
    return _errors[exception.code] ?? exception.message;
  }

  // if exception.code cannot be found in _errors map then use exception.message

  static Map<String, String> _errors = {
    'ERROR_WEAK_PASSWORD':
        'Password is too weak. Expected 6 characters or more with a symbol & number',
    'ERROR_INVALID_EMAIL': 'Invalid email format. Try again.',
    'ERROR_EMAIL_ALREADY_IN_USE':
        'This email address is already in use. Try another email address or Sign In.',
    'ERROR_WRONG_PASSWORD': 'Sorry, the password isn\'t right.',
    'ERROR_USER_NOT_FOUND': 'Invalid credentials. Try again or register today!',
    'ERROR_USER_DISABLED': 'Sorry! This user has been disabled.',
    'ERROR_TOO_MANY_REQUESTS':
        'You\'ve placed too many requests to sign in. Please wait.',
    'ERROR_OPERATION_NOT_ALLOWED':
        'You\'re account has not been enabled yet. Please wait.'
  };
}
