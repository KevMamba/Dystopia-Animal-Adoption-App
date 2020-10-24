import 'package:dystopia_flutter_app/screens/search_page.dart';
import 'package:dystopia_flutter_app/widgets/pet_category.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DystopiaDetails extends StatefulWidget {
  // creating a stateful widget
  @override
  State createState() => new DystopiaDetailsState(); // creating the state
}

class DystopiaDetailsState extends State<DystopiaDetails> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(414, 896),
      allowFontScaling: true,
    );
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.w),
            bottomLeft: Radius.circular(20.w),
          ),
          child: Image(
            image: AssetImage("assets/images/dystopia-top.png"),
            fit: BoxFit.cover,
            width: double.infinity,
            height: ScreenUtil().screenHeight / 2.2,
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
              left: 20.0, top: 20.0, right: 20.0
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "About Dystopia",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFb9815d),
                  ),
                ),
                SizedBox(height: 10.w),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Orci eu lobortis elementum nibh tellus molestie nunc non."),
              ],
            )),
        Center(
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.w),
            ),
            onPressed: (){},
            color: Color(0xFFb9815d),
            child: Text("Volunteer at Dystopia")
          )
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.w),
              ),
            )
        )),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffb9815d),
              borderRadius: BorderRadius.circular(20.w),
              boxShadow: [
                BoxShadow(
                  offset: Offset(3, 3),
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.16),
                  spreadRadius: -3,
                )
              ],
            ),
            child: Column(
              children: <Widget>[
                 Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 10.w),
                        width: ScreenUtil().screenWidth*0.45,
                        child: Text(
                            "In this unprecedented time, we need your help more than ever! Please consider donating to help us care for our animals.")),
                    Image(image: AssetImage(
                        "assets/images/donate-dogs.png"
                    ),
                        fit: BoxFit.contain)
                  ],
                ),
                RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        onPressed: (){},
                        color: Colors.white,
                        child: Text("Donate")
                    ),
              ],
            ),
          )
        ),
        SizedBox(height: 100.h),
      ],
    )));
  }
}
