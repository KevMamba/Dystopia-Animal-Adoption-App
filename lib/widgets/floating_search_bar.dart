import 'package:dystopia_flutter_app/screens/pet_search/filter_screen.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchBar extends StatefulWidget {
  @override
  _FloatingSearchBarState createState() => _FloatingSearchBarState();
}

class _FloatingSearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    final controller = FloatingSearchBarController();

    return FloatingSearchBar(
      controller: controller,
      borderRadius: BorderRadius.circular(20),
      margins: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      elevation: 10,
      showAfter: Duration(milliseconds: 1000),

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
          showIfClosed: false,
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
                // showBarModalBottomSheet(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(30),
                //         topRight: Radius.circular(30),
                //       ),
                //     ),
                //     context: context,
                //     builder: (context, scrollController) {
                //       return
                //     });

                PlatformPageRoute(
                    fullScreen: true,
                    widget: FilterScreen(),
                    fromRoot: false,
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
      transition: ExpandingFloatingSearchBarTransition(),
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
}
