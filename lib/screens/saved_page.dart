import 'package:dystopia_flutter_app/widgets/custom_scaffold.dart';
import 'package:dystopia_flutter_app/widgets/pet_list_card.dart';
import 'package:flutter/material.dart';
import 'package:dystopia_flutter_app/data/saved_page_model.dart';
import 'package:provider/provider.dart';

class SavedPage extends StatefulWidget {

  @override
  State createState() => new SavedPageState();
}

class SavedPageState extends State<SavedPage> {

  Stream<List<PetResults>> get currentFavorites async*{
    await Future.delayed(Duration(seconds: 2));
    yield SavedModel.favorites;
  }

  Container _buildText(){
    return Container(
      padding: EdgeInsets.only(top: 60.0, left: 30.0, bottom: 60.0),
      child: Text("Favorites",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )
          ),
      );
}
  @override
  Widget build(BuildContext context){

    return CustomScaffold(
      header: _buildText(),
      searchBar: false,
      body: StreamBuilder<List<PetResults>>(
        stream: currentFavorites,
        builder: (context, snapshot){
          if (snapshot.data == null)
            return CircularProgressIndicator();
          else {
            return ListView.builder(
              itemCount: SavedModel.favorites.length,
              itemBuilder: (context, index) {
                return SavedModel.favorites[index];
              },
            );
          }
        }
      )
    );
  }

}