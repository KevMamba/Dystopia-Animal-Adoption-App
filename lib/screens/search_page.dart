import 'package:dystopia_flutter_app/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      searchBar: true,
      body: Center(
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
              Text("5. Make a wise decision and talk to its owner."),
            ],
          ),
        ),
      ),
    );
  }
}
