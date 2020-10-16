import 'package:dystopia_flutter_app/screens/list_of_pets.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';

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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              PlatformPageRoute.pageRoute(
                  fullScreen: false,
                  widget: ListScreen(),
                  fromRoot: true,
                  context: context);
            },
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                    child: Text(emoji, style: TextStyle(fontSize: 50.0))
                )
            ),
          ),
        ),
      ),
    );
  }
}