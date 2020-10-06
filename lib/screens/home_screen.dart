import 'package:dystopia_flutter_app/screens/pet_list.dart';
import 'package:dystopia_flutter_app/widgets/pet_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dystopia_flutter_app/widgets/searchbox.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';
import 'package:dystopia_flutter_app/screens/pet_list.dart';


class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {


  SliverToBoxAdapter petCategories() {
    List<PetCategory> _tiles = [
      PetCategory(
        image: 'assets/images/dogs_icon.png',
        name: "Dogs",
      ),
      PetCategory(
        image: 'assets/images/cat.png',
        name: "Cats",
      ),
      PetCategory(
        image: 'assets/images/Other_icon.png',
        name: "Others",
      ),
    ];

    return SliverToBoxAdapter(
      child: Container(
        color: Color(0xFFedf3eb),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        height: MediaQuery.of(context).size.height / 4,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width / 3.25,
              padding: EdgeInsets.symmetric(
                horizontal: 5,
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
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFb9725d),
            Color(0xFFe2c5bd),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                "Can\'t look after your pet due to unforeseen circumstances? List your pet today and let us help you find their next owner.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton.icon(
                height: 50,
                color: Color(0xFF875433),
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
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  SliverAppBar carouselAppBar() {
    return SliverAppBar(
      expandedHeight: (MediaQuery.of(context).size.height + 40) / 2.5,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
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
          itemWidth: MediaQuery.of(context).size.width,
          itemCount: 3,
          pagination: new SwiperPagination(),
          control: new SwiperControl(
            size: 0.0,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
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
    return Scaffold(
      backgroundColor: Color(0xFFedf3eb),
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
                padding: const EdgeInsets.only(
                  top: 25.0,
                ),
                child: Divider(),
              ),
              Expanded(
                flex: 2,
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [
                      petCategories(),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                      ),
                      petList(),
                      // scroll helper
                      SliverToBoxAdapter(
                        child: Container(
                          height: 50,
                          color: Colors.transparent,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: (MediaQuery.of(context).size.height + 30) / 2.5,
              width: MediaQuery.of(context).size.width,
              child: Align(
                child: buildSearchBox(),
              ),
            ),
          ],
        ),
      );
    }
  }
