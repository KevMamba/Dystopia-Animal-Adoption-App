import 'package:dystopia_flutter_app/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:dystopia_flutter_app/data/saved_page_model.dart';
import 'package:provider/provider.dart';

class SavedPage extends StatefulWidget {

  final SavedModel model;
  SavedPage({@required this.model});

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider<SavedModel>(
      create: (context) => SavedModel(),
      child: Consumer<SavedModel>(
        builder: (context, model, _) => SavedPage(model: model),
      ),
    );
  }
  @override
  State createState() => new SavedPageState();
}

class SavedPageState extends State<SavedPage> {

  SavedModel get model => widget.model;

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
      body: ListView.builder(
        itemBuilder: (context, index) {
          return model.favorites[index];
        },
        itemCount: model.favorites.length,
      ),
    );
  }

}