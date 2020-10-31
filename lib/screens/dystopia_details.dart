import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DystopiaDetails extends StatefulWidget {
  @override
  State createState() => new DystopiaDetailsState();
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
      body: Scrollbar(
        child: SingleChildScrollView(
            child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    40.w,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(39.w),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(3, 3),
                          blurRadius: 2,
                          color: Colors.black.withOpacity(0.16),
                          spreadRadius: -3,
                        )
                      ],
                    ),
                    height: ScreenUtil().screenHeight / 2,
                    child: Image(
                      image: AssetImage("assets/images/dystopia-top.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 39.w, top: 20.0, right: 39.w, bottom: 15),
                child: Container(
                  height: ScreenUtil().screenHeight / 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "About Dystopia",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      SizedBox(height: 10.w),
                      Flexible(
                        child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Orci eu lobortis elementum nibh tellus molestie nunc non."),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  onPressed: () {},
                  color: Theme.of(context).colorScheme.primaryVariant,
                  child: Text("Volunteer at Dystopia"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 39.w),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 2,
                              child: Text(
                                  "In this unprecedented time, we need your help more than ever! Please consider donating to help us care for our animals."),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 2,
                              child: Image(
                                  image: AssetImage(
                                      "assets/images/donate-dogs.png"),
                                  fit: BoxFit.contain),
                            ),
                          ],
                        ),
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.w),
                            ),
                            onPressed: () {},
                            color: Theme.of(context).colorScheme.primaryVariant,
                            child: Text("Donate")),
                      ],
                    ),
                  )),
              SizedBox(height: 30.h),
            ],
          ),
        )),
      ),
    );
  }
}
