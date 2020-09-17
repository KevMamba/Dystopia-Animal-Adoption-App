import 'dart:io';

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
