import 'package:dystopia_flutter_app/screens/list_of_pets.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';
import 'package:flutter/material.dart';

class PetCategory extends StatelessWidget {
  final String emoji;
  final String name;

  final BuildContext context;
  const PetCategory({
    Key key,
    this.context,
    this.emoji,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            PlatformPageRoute.pageRoute(
              fullScreen: false,
              widget: ListScreen(),
              fromRoot: true,
              context: context,
            );
          },
          child: Center(
            child: Text(
              emoji,
              style: TextStyle(fontSize: 50.0),
            ),
          ),
        ),
      ),
    );
  }
}
