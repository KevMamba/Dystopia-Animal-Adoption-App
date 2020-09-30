import 'package:dystopia_flutter_app/theme.dart';
import 'package:dystopia_flutter_app/widgets/pet_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          buildCarousel(context),
          //buildFloatingSearchBar(context),
        ],
      ),
    );
  }

  Widget buildCarousel(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      alignment: AlignmentDirectional.bottomCenter,
      child: Stack(
        children: <Widget>[
          Swiper(
            autoplay: true,
            autoplayDelay: 3000,
            duration: 1000,
            curve: Curves.easeInOut,
            autoplayDisableOnInteraction: true,
            layout: SwiperLayout.STACK,
            // customLayoutOption:
            //     new CustomLayoutOption(startIndex: -1, stateCount: 3)
            //         .addRotate([45.0 / 180, 0.0, -45.0 / 180]).addTranslate([
            //   new Offset(-370.0, -40.0),
            //   new Offset(0.0, 0.0),
            //   new Offset(370.0, -40.0)
            // ]),
            controller: SwiperController(),
            itemHeight: MediaQuery.of(context).size.height,
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
                  image: AssetImage('assets/images/Final-RGB.jpg'),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildFloatingSearchBar(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: FloatingSearchBar(
        hint: 'Your Location',
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 20),
        transitionDuration: const Duration(milliseconds: 800),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        maxWidth: isPortrait ? 600 : 500,
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: (query) {
          // Call your model, bloc, controller here.
        },
        // Specify a custom transition to be used for
        // animating between opened and closed stated.
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: CircularButton(
              icon: const Icon(Icons.place),
              onPressed: () {},
            ),
          ),
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: Colors.accents.map((color) {
                  return Container(height: 112, color: color);
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
