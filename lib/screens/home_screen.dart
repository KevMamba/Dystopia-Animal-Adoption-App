import 'package:align_positioned/align_positioned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  TextEditingController _search;

  buildCarousel2(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width + 40,
      child: Column(
        children: [
          Stack(children: [
            Container(
              height: MediaQuery.of(context).size.width,
              child: Swiper(
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
          ]),
        ],
      ),
    );
  }

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
                  hintText: "Search for pets near you",
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
    /* 
      SinglechildScrollView has been added to prevent RenderFlex overflowed error.
      Error Source: Keyboard. 
      */
    return SingleChildScrollView(
      child: Stack(
        children: [
          buildCarousel2(context),
          AlignPositioned.expand(
            dx: 0,
            dy: -23.5,
            alignment: Alignment.bottomCenter,
            child: buildSearchBox(),
          )
        ],
      ),
    );
  }
}
