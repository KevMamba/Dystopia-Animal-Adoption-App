import 'package:dystopia_flutter_app/screens/pet_search/search_page.dart';
import 'package:dystopia_flutter_app/services/auth.dart';
import 'package:dystopia_flutter_app/services/database_chat.dart';
import 'package:dystopia_flutter_app/widgets/pet_category.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';
import 'package:dystopia_flutter_app/screens/forms/give_up_for_adoption/GUFA_1.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  Widget buildSearchBox() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 55.h),
      child: Container(
        height: 65.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(35.w),
          ),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(35.w),
          ),
          child: RaisedButton(
            onPressed: () {
              PlatformPageRoute.pageRoute(
                fullScreen: false,
                widget: SearchPage(),
                fromRoot: true,
                context: context,
              );
            },
            color: Theme.of(context).cardColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.search),
                Text(
                  "Search for a pet...",
                  style: TextStyle(
                    fontSize: 23.h,
                  ),
                ),
                Opacity(
                  opacity: 0.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget petCategories() {
    final user = Provider.of<User>(context, listen: false);
    final database = Provider.of<FirestoreDatabase>(context, listen: false);
    Widget _label = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Popular Pets",
          style: TextStyle(
            fontSize: 30.h,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );

    List<PetCategory> _tiles = [
      PetCategory(
        emoji: '🐶',
        name: "Dogs",
        context: context,
        user: user,
        database: database,
      ),
      PetCategory(
        emoji: '🐦',
        name: "Birds",
        context: context,
        user: user,
        database: database,
      ),
      PetCategory(
        emoji: '🐈',
        name: "Cats",
        context: context,
        user: user,
        database: database,
      ),
      PetCategory(
        emoji: '🐹',
        name: "Others",
        context: context,
        user: user,
        database: database,
      ),
    ];
    return SizedBox(
      width: ScreenUtil().screenWidth,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _label,
            Expanded(
              child: SafeArea(
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _tiles.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 50.w,
                    crossAxisSpacing: 15.h,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(3, 3),
                            blurRadius: 2,
                            color: Colors.black.withOpacity(0.16),
                            spreadRadius: -3,
                          )
                        ],
                      ),
                      child: _tiles[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listForAdoption() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
        vertical: 25.h,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.w),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Center(
              child: Text(
                "Can\'t look after your pet due to unforeseen reasons? \nList your pet today and let us help you find their next owner.",
                style: TextStyle(
                  fontSize: 25.h,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF875433),
              borderRadius: BorderRadius.circular(20),
            ),
            child: FlatButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                PlatformPageRoute.pageRoute(
                  fullScreen: false,
                  widget: GUFA(),
                  fromRoot: true,
                  context: context,
                );
              },
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: Text(
                "Start now!",
                style: TextStyle(fontSize: 22.h, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(414, 896),
      allowFontScaling: true,
    );
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  height: ScreenUtil().screenHeight / 2,
                  child: Swiper(
                      autoplay: true,
                      autoplayDelay: 6000,
                      duration: 1000,
                      curve: Curves.easeInOut,
                      autoplayDisableOnInteraction: true,
                      layout: SwiperLayout.STACK,
                      controller: SwiperController(),
                      itemWidth: ScreenUtil().screenWidth,
                      itemCount: 3,
                      pagination: new SwiperPagination(),
                      control: new SwiperControl(
                        size: 0.0,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40.w),
                              bottomRight: Radius.circular(40.w)),
                          child: Image(
                            image: AssetImage('assets/images/Home_image.png'),
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        );
                      }),
                )),
            Padding(
              padding: EdgeInsets.only(
                top: 30.h,
              ),
              child: Divider(),
            ),
            Expanded(
              flex: 2,
              child: Scrollbar(
                child: PageView.custom(
                  scrollDirection: Axis.vertical,
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index == 0) {
                        return petCategories();
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10,
                          ),
                          child: SafeArea(
                            child: listForAdoption(),
                          ),
                        );
                      }
                    },
                    childCount: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: (ScreenUtil().screenHeight + 40) / 2.5,
          width: ScreenUtil().screenWidth,
          child: buildSearchBox(),
        ),
      ],
    );
  }
}
