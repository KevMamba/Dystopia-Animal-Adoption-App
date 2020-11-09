import 'package:dystopia_flutter_app/data/constants.dart';
import 'package:dystopia_flutter_app/screens/account.dart';
import 'package:dystopia_flutter_app/screens/chat/main_page.dart';
import 'package:dystopia_flutter_app/screens/dystopia_details.dart';
import 'package:dystopia_flutter_app/screens/saved_page.dart';
import 'package:dystopia_flutter_app/services/auth.dart';
import 'package:dystopia_flutter_app/services/database_chat.dart';
import 'package:dystopia_flutter_app/services/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:provider/provider.dart';

import '../screens/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  final User user;

  const BottomNavigation({Key key, this.user}) : super(key: key);
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
    with SingleTickerProviderStateMixin {
  var _bottomNavIndex;

  @override
  void initState() {
    super.initState();
    _bottomNavIndex = 0;
    getUserInfo();
    final systemTheme = SystemUiOverlayStyle.light;

    SystemChrome.setSystemUIOverlayStyle(systemTheme);
  }

  Future<void> getUserInfo() async {
    final val = await Future.wait([
      SaveData.getUserImage(),
      SaveData.getUserName(),
      SaveData.getUserEmail()
    ]);

    Constants.image = val[0];
    // the following line assigns null to loggedUser.
    //  Constants.loggedUser = val[1];
    Constants.loggedEmail = val[2];
  }

  ShapeBorder customBottomBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30), topRight: Radius.circular(30)),
  );

  final List _screens = [
    HomePage2(),
    SavedPage(),
    DystopiaDetails(),
    ChatHome(),
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
        bottomNavigationBar: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          shadowColor: Colors.brown[100],
          elevation: 10,
          snakeShape: SnakeShape.rectangle,
          snakeViewColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.secondaryVariant,
          selectedItemColor: Theme.of(context).colorScheme.primaryVariant,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          shape: customBottomBarShape,
          currentIndex: _bottomNavIndex,
          onTap: (index) => setState(() => _bottomNavIndex = index),
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favourites",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'assets/images/pet_logo.png',
                ),
                size: 100,
              ),
              // label: "About",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Account',
            ),
          ],
        ));
  }
}

// TODO: Resize the paw icon
/**
 * 
 * ImageIcon(
                AssetImage(
                  'assets/images/pet_logo.png',
                ),
 */
