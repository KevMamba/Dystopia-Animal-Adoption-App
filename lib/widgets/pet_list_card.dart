
import 'package:dystopia_flutter_app/screens/pet_search/pet_results.dart';
import 'package:dystopia_flutter_app/services/auth.dart';
import 'package:dystopia_flutter_app/services/database_chat.dart';

import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dystopia_flutter_app/widgets/helper_buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class PetResults extends StatefulWidget {
  final String petPic;
  final String petName;
  final String petBreed;
  final String petAge;
  final User user;
  final FirestoreDatabase database;
  final VoidCallback onTap;
  bool liked;

  PetResults({
    Key key,
    this.petPic,
    this.petName,
    this.petBreed,
    this.petAge,
    this.user,
    this.database,
    this.onTap,
    this.liked = false,

  }) : super(key: key);

  @override
  State createState() => new PetResultState();
}

class PetResultState extends State<PetResults>{

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(414, 896),
      allowFontScaling: true,
    );

    return GestureDetector(
      onTap: () {
        PlatformPageRoute.pageRoute(
            fullScreen: false,
            widget: PetResultScreen(
              pet: widget,
              user: widget.user,
              database: widget.database,
            ),
            fromRoot: false,
            context: context);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(39.w),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 39.w, vertical: 26.w),
          height: ScreenUtil().screenHeight / 2.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(39.w),
            color: Colors.white70,
          ),
          child: Material(
            type: MaterialType.card,
            borderRadius: BorderRadius.circular(39.w),
            child: Stack(
              children: [
                Hero(
                  tag: widget.petPic,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    height: ScreenUtil().screenHeight / 3.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          12.w,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 8.0,
                          )
                        ],
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(
                            widget.petPic,
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 15,
                  child: Container(
                    width: 290.w,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${widget.petName}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              FavoriteButton(item: widget),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "${widget.petBreed}",
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
        //
      ),
    );
  }
}
