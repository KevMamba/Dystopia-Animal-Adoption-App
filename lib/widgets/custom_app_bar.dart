import 'package:dystopia_flutter_app/theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      //forceElevated: true,
      elevation: 20,
      backgroundColor: Colors.transparent,
      floating: false,
      toolbarHeight: 55,
      leadingWidth: 0.0,
      leading: Opacity(
        opacity: 0.0,
      ),
      title: Container(
        margin: EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 15,
                      color: Colors.black,
                    ),
                    Text(
                      ' User_Location',
                      style: kLabelStyleAppBar,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => {debugPrint("CHANGE TAPPED!")},
                  child: Text(
                    "Change",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/images/Dystopia_logo_png.png',
              filterQuality: FilterQuality.high,
              fit: BoxFit.contain,
              height: 60,
            ),
          ],
        ),
      ),
      //bottom: PreferredSize(
      //preferredSize: Size.fromHeight(15),
      //  child: Divider(
      //thickness: 1,
      //)),
    );
  }
}
