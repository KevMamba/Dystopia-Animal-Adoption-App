import 'package:dystopia_flutter_app/theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Color(0xFFbabfab),
      elevation: 5.0,
      //leadingWidth: 0.0,
      leading: Opacity(
        opacity: 0.0,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    /*Icon(
                      Icons.location_pin,
                      size: 15,
                    ),*/
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
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * 0.39,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset(
                'assets/images/Dystopia_logo_png.png',
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                height: 53.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.00);
}
