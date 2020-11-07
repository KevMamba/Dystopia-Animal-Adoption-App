import 'package:flutter/material.dart';

import 'floating_search_bar.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Widget header;
  final bool searchBar;
  const CustomScaffold(
      {Key key, @required this.body, this.searchBar, this.header})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Opacity(
                      opacity: 0.0,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: Material(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: body,
                ),
              ),
            ],
          ),
          _buildHeader(),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildHeader() {
    if (searchBar) {
      return SearchBar();
    }
    return header;
  }
}
