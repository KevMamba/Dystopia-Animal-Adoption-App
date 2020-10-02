import 'package:dystopia_flutter_app/widgets/pet_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  TextEditingController _search;

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
            child: TextField(
              controller: _search,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  hintText: "Search for pets...",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      )),
                  prefixIcon: Icon(
                    Icons.search,
                  )),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      backgroundColor: Color(0xFFedf3eb),
      body: Stack(
        children: [
          CustomScrollView(
            physics: NeverScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                collapsedHeight: MediaQuery.of(context).size.width / 1.25,
                expandedHeight: (MediaQuery.of(context).size.width + 40) / 1.25,
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
                floating: true,
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
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Color(0xFFedf3eb),
                  padding: EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 30.0,
                  ),
                  height: MediaQuery.of(context).size.height / 4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width / 4,
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        child: _tiles[index],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: (MediaQuery.of(context).size.width + 35) / 1.25,
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

/* TODO: Tried to implement Spotify scroll view. https://stackoverflow.com/questions/52133238/flutter-customscrollview-slivers-stackingx
         Use innerScrollController to handle the offset of the searchButton. https://api.flutter.dev/flutter/widgets/NestedScrollViewState-class.html


      ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

// position of the search bar.
  double get top {
    double res = (MediaQuery.of(context).size.width + 35) / 1.25;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      if (offset < (res - MediaQuery.of(context).size.width / 1.25)) {
        res -= offset;
      } else {
        res = MediaQuery.of(context).size.width / 1.25;
      }
    }
    return res;
  }

          
          NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
 SliverAppBar(
                collapsedHeight: MediaQuery.of(context).size.width / 1.25,
                expandedHeight: (MediaQuery.of(context).size.width + 40) / 1.25,
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
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 12,
                        child: Container(),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text("Our stories"),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
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
              ),
              ];
            },
            body: ListView.builder() ,
          ),*/
