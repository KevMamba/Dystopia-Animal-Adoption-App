import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'filter_screen.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Widget buildFloatingSearchBar() {
    final controller = FloatingSearchBarController();

    return FloatingSearchBar(
      controller: controller,
      // borderRadius: BorderRadius.circular(20),
      // margins: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      elevation: 10,
      showAfter: Duration(milliseconds: 1000),
      showDrawerHamburger: true,
      clearQueryOnClose: true,
      hint: 'Enter Location',
      iconColor: Colors.grey[400],
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOutCubic,
      physics: const BouncingScrollPhysics(),
      axisAlignment: 0.0,
      openAxisAlignment: 0.0,
      maxWidth: 600,
      actions: [
        FloatingSearchBarAction(
          showIfOpened: true,
          child: Tooltip(
            message: "Filters",
            child: IconButton(
              splashRadius: 20,
              icon: Icon(
                Icons.tune,
                color: Colors.grey[400],
                semanticLabel: "Filters",
              ),
              onPressed: () {
                PlatformPageRoute.pageRoute(
                    fullScreen: true,
                    widget: FilterScreen(),
                    fromRoot: true,
                    context: context);
              },
            ),
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      //progress: model.isLoading,
      debounceDelay: const Duration(milliseconds: 500),
      //onQueryChanged: model.onQueryChanged,
      transition: SlideFadeFloatingSearchBarTransition(),
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
      //body: buildBody(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "1. Enter your location",
                  ),
                  Text(
                    "2. Filter your search",
                  ),
                  Text(
                    "3. Browse through a list of pets that we find based on your needs.",
                  ),
                  Text(
                      "4. Tap on ♥️ and you can find those pets under the Saved section."),
                  Text("5. Make a wise decision and talk to it's owner."),
                ],
              ),
            ),
          ),
          buildFloatingSearchBar(),
        ],
      ),
    );
  }
}
