import 'dart:math';

import 'package:flutter/material.dart';

class FixedDockedFabLocation extends FloatingActionButtonLocation {
  const FixedDockedFabLocation({
    this.context,
  });
  final context;

  @protected
  double getDockedY(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double contentBottom = scaffoldGeometry.contentBottom;
    final double bottomSheetHeight = scaffoldGeometry.bottomSheetSize.height;
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    final double snackBarHeight = scaffoldGeometry.snackBarSize.height;
    double bottomDistance = MediaQuery.of(context).viewInsets.bottom;

    double fabY = contentBottom + bottomDistance - fabHeight / 2.0;

    // The FAB should sit with a margin between the snack bar and itself.
    if (snackBarHeight > 0.0)
      fabY = min(
          fabY,
          contentBottom -
              snackBarHeight -
              fabHeight -
              kFloatingActionButtonMargin);

    // The FAB should sit with its center in front of the top of the bottom sheet.
    if (bottomSheetHeight > 0.0)
      fabY = min(fabY, contentBottom - bottomSheetHeight - fabHeight / 2.0);

    final double maxFabY = scaffoldGeometry.scaffoldSize.height - fabHeight;
    return min(maxFabY, fabY);
  }

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width -
            scaffoldGeometry.floatingActionButtonSize.width) /
        2.0;
    //1.05;
    return Offset(fabX, getDockedY(scaffoldGeometry));
  }
}

// source : https://github.com/bizz84/bottom_bar_fab_flutter/issues/2
