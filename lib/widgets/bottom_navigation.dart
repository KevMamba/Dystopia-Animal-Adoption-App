import 'package:dystopia_flutter_app/screens/account.dart';
import 'package:dystopia_flutter_app/screens/dystopia_details.dart';
import 'package:dystopia_flutter_app/screens/saved_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import '../screens/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
    with SingleTickerProviderStateMixin {
  var _bottomNavIndex;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _bottomNavIndex = 0;
    final systemTheme = SystemUiOverlayStyle.light;
    SystemChrome.setSystemUIOverlayStyle(systemTheme);
  }

  ShapeBorder customBottomBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30), topRight: Radius.circular(30)),
  );
  ShapeBorder customBottomBarShape1 = BeveledRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  );

  final List _screens = [
    HomePage2(),
    SavedPage(),
    DystopiaDetails(),
    Scaffold(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(414, 896),
      allowFontScaling: true,
    );
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: _screens[_bottomNavIndex],
        bottomNavigationBar: SnakeNavigationBar(
          elevation: 10,
          snakeShape: SnakeShape.rectangle,
          style: SnakeBarStyle.floating,
          snakeColor: Theme.of(context).colorScheme.secondaryVariant,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          shape: customBottomBarShape,
          currentIndex: _bottomNavIndex,
          onPositionChanged: (index) => setState(() => _bottomNavIndex = index),
          items: [
            BottomNavigationBarItem(
              // label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              // label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'assets/images/pet_logo.png',
                ),
                size: 70,
              ),
              // label: "About Us",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              // label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              // label: 'Account',
            ),
          ],
        ));
  }
}
