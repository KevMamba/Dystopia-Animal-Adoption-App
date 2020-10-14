import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kLabelStyleAppBar = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 13.0,
  fontFamily: 'OpenSans',
);

final kLabelStyleHeader = TextStyle(
  color: Colors.white,
  fontSize: 15,
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFb0abbf),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kBoxDecorationStyleCarousel = BoxDecoration(
  color: Color(0xFFb0abbf),
  borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kSignUpColors = <Color>[
  Color(0xFFe3e5dd),
  Color(0xFFd5d8cc),
  Color(0xFFc7cbbb),
  Color(0xFFbabfab),
];

const kSpacingUnit = 10;

const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFFC107);

final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);
/*
final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SFProText',
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
        color: kLightSecondaryColor,
      ),
  textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kLightSecondaryColor,
        displayColor: kLightSecondaryColor,
      ),
);*/

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
  accentColorBrightness: Brightness.light,
  primaryColorBrightness: Brightness.light,
  applyElevationOverlayColor: true,
  // added for GroovinExpansionTile widget
  accentColor: Colors.white,
  colorScheme: ColorScheme(
    onPrimary: Colors.black,
    onSecondary: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Color(0xaaF5E0C3),
    onSurface: Colors.black,
    brightness: Brightness.light,
    onError: Colors.white,
    primary: Colors.white,
    secondary: Color(0xFFb9815d),
    secondaryVariant: Color(0xFFb9815d),
    primaryVariant: Colors.brown[100],
    error: Colors.red,
  ),
  canvasColor: Color(0xffE09E45),
  scaffoldBackgroundColor: Colors.white,
  cardColor: Color(0xaaF5E0C3),
  dividerColor: Colors.brown[300],
  focusColor: Color(0xFFF5E0C3),
  hoverColor: Color(0xffDEC29B),
  splashColor: Colors.brown[400],
  selectedRowColor: Colors.grey,
  unselectedWidgetColor: Colors.grey.shade400,
  disabledColor: Colors.grey.shade600,
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xffcba186),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(),
  secondaryHeaderColor: Colors.black,
  // textSelectionTheme: TextSelectionThemeData(
  //   selectionColor: Color(0xffB5BFD3),
  //   cursorColor: Color(0xff936F3E),
  //   selectionHandleColor: Color(0xff936F3E),
  // ),
  backgroundColor: Colors.white,
  dialogBackgroundColor: Colors.white,
  indicatorColor: Color(0xff457BE0),
  hintColor: Colors.grey,
  errorColor: Colors.red,
  textTheme: TextTheme(
      //text themes that contrast with card and canvas
      ),
  primaryTextTheme: TextTheme(
      //text theme that contrast with primary color
      ),
  accentTextTheme: TextTheme(
      //text theme that contrast with accent Color
      ),
  inputDecorationTheme: InputDecorationTheme(
      // default values for InputDecorator, TextField, and TextFormField
      ),
  iconTheme: IconThemeData(
      //icon themes that contrast with card and canvas
      ),
  primaryIconTheme: IconThemeData(
      //icon themes that contrast primary color
      ),
  accentIconTheme: IconThemeData(
      //icon themes that contrast accent color
      ),
);
