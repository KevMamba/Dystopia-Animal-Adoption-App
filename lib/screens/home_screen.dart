import 'package:dystopia_flutter_app/widgets/pet_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  Padding buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
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
                    fontSize: 15,
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
        height: MediaQuery.of(context).size.height / 3,
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
            Color(0xFFbbc7b9),
            Color(0xFFe3e5e2),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Text(
                "Can\'t look after your pet due to unforeseen reasons? List your pet today and let us help you find their next owner.",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF875433),
                borderRadius: BorderRadius.circular(20),
              ),
              child: FlatButton.icon(
                //height: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                label: Text(
                  "Start now",
                  style: TextStyle(fontSize: 15, color: Colors.white),
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
      expandedHeight: (MediaQuery.of(context).size.height + 40) / 2.5,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      //leadingWidth: 0.0,
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
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        vertical: 30,
                      ),
                    ),
                    petCategories(),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        vertical: 25,
                      ),
                    ),
                    petList(),
                    // scroll helper
                    SliverToBoxAdapter(
                      child: Container(
                        height: 180,
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
