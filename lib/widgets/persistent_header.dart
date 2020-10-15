import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'helper_buttons.dart';

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final BuildContext context;
  final String petPic;

  PersistentHeader({@required this.context, @required this.petPic});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(fit: StackFit.expand, children: [
      Hero(
        tag: petPic,
        child: Container(
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                30,
              ),
              bottomRight: Radius.circular(
                30,
              ),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                30,
              ),
              bottomRight: Radius.circular(
                30,
              ),
            ),
            child: Opacity(
              opacity: responsiveOpacity(shrinkOffset),
              child: Image(
                image: AssetImage(
                  petPic,
                ),
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 20,
        left: 20,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Marley",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(
                    responsiveOpacity(shrinkOffset),
                  ),
                ),
              ),
              Text(
                "Golden Retriever",
                style: TextStyle(
                  color: Colors.white.withOpacity(
                    responsiveOpacity(
                      shrinkOffset,
                    ),
                  ),
                  fontSize: 15,
                ),
              ),
            ]),
      ),
      Positioned(
        bottom: 20,
        right: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "3 months",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white.withOpacity(
                  responsiveOpacity(
                    shrinkOffset,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.white.withOpacity(
                    responsiveOpacity(
                      shrinkOffset,
                    ),
                  ),
                ),
                Text(
                  "Bangalore",
                  style: TextStyle(
                    color: Colors.white.withOpacity(
                      responsiveOpacity(
                        shrinkOffset,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        top: 0,
        child: Container(
          decoration: BoxDecoration(
            color: makeStickyHeaderBgColor(shrinkOffset),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          // Background color
          child: SafeArea(
            bottom: false,
            child: Container(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: this.makeStickyHeaderTextColor(
                            shrinkOffset, true), // Return icon color
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      "Marley",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: this.makeStickyHeaderTextColor(
                            shrinkOffset, false), // Title color
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: FavoriteButton(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  double responsiveOpacity(double shrinkOffset) {
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();
    return Color.fromARGB(alpha, 185, 129, 93);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.grey : Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
          .clamp(0, 255)
          .toInt();
      return Color.fromARGB(alpha, 255, 255, 255);
    }
  }

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => MediaQuery.of(context).size.width;

  @override
  double get minExtent => 80;
}
