import 'package:dystopia_flutter_app/screens/list_of_pets.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';
import 'package:flutter/material.dart';

class PetCategory extends StatelessWidget {
  final String image;
  final String name;

  final BuildContext context;
  const PetCategory({
    Key key,
    this.context,
    this.image,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Tooltip(
        message: name,
        child: Material(
          type: MaterialType.canvas,
          child: InkWell(
            onTap: () {
              PlatformPageRoute.pageRoute(
                  fullScreen: false,
                  widget: ListScreen(),
                  fromRoot: true,
                  context: context);
            },
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
