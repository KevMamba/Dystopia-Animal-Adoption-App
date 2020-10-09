import 'package:dystopia_flutter_app/widgets/pet_category.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  Padding buildSearchBox() {
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
            onPressed: () {},
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

  SliverToBoxAdapter petCategories() {
    List<PetCategory> _tiles = [
      PetCategory(
        image: 'assets/images/dogs_icon.png',
        name: "Dogs",
        context: context,
      ),
      PetCategory(
        image: 'assets/images/cat.png',
        name: "Cats",
        context: context,
      ),
      PetCategory(
        image: 'assets/images/Other_icon.png',
        name: "Others",
        context: context,
      ),
    ];
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white, //Color(0xFFedf3eb),
        padding: EdgeInsets.symmetric(
          vertical: 12.w,
          horizontal: 17.w,
        ),
        height: ScreenUtil().screenHeight / 4,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width / 3.25,
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              child: _tiles[index],
            );
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter petList() {
    return SliverToBoxAdapter(
      child: Container(
        height: ScreenUtil().screenHeight / 3,
        margin: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 6.h,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 25.h,
          horizontal: 25.w,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFbbc7b9),
            Color(0xFFe3e5e2),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(40.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Text(
                "Can\'t look after your pet due to unforeseen reasons? List your pet today and let us help you find their next owner.",
                style: TextStyle(
                  fontSize: 25.h,
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF875433),
                borderRadius: BorderRadius.circular(20),
              ),
              child: FlatButton.icon(
                height: 32.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.night_shelter,
                  color: Colors.white,
                ),
                label: Text(
                  "Start now",
                  style: TextStyle(fontSize: 22.h, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverAppBar carouselAppBar() {
    return SliverAppBar(
      expandedHeight: (ScreenUtil().screenHeight + 40) / 2.5,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.w),
          bottomRight: Radius.circular(40.w),
        ),
      ),
      leadingWidth: 0.0,
      leading: Opacity(
        opacity: 0.0,
      ),
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Swiper(
          autoplay: true,
          autoplayDelay: 3000,
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
          },
        ),
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
    return Scaffold(
      backgroundColor: Colors.white, //Color(0xFFedf3eb),
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: CustomScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  slivers: <Widget>[
                    carouselAppBar(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 25.h,
                ),
                child: Divider(),
              ),
              Expanded(
                flex: 2,
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        vertical: 45.h,
                      ),
                    ),
                    petCategories(),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        vertical: 40.h,
                      ),
                    ),
                    petList(),
                    // scroll helper
                    SliverToBoxAdapter(
                      child: Container(
                        height: 290.h,
                        color: Colors.transparent,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: (ScreenUtil().screenHeight + 30) / 2.5,
            width: ScreenUtil().screenWidth,
            child: Align(
              child: buildSearchBox(),
            ),
          ),
        ],
      ),
    );
  }
}
