import 'package:dystopia_flutter_app/screens/pet_search/list_of_pets.dart';
import 'package:dystopia_flutter_app/services/auth.dart';
import 'package:dystopia_flutter_app/services/database_chat.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';
import 'package:flutter/material.dart';

class PetCategory extends StatelessWidget {
  final String emoji;
  final String name;
  final BuildContext context;
  final User user;
  final FirestoreDatabase database;
  const PetCategory({
    Key key,
    this.context,
    this.emoji,
    this.name,
    this.user,
    this.database,
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
              widget: ListScreen(
                user: this.user,
                database: this.database,
              ),
              fromRoot: false,
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
