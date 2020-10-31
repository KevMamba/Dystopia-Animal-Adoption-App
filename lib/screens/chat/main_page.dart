import 'package:dystopia_flutter_app/widgets/chat/category_selector.dart';
import 'package:dystopia_flutter_app/widgets/chat/recent_chat.dart';
import 'package:dystopia_flutter_app/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class ChatHome extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatHome> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: RecentChats(),
      searchBar: false,
      header: CategorySelector(),
    );
  }
}

/*
   CategorySelector(),
    RecentChats(),
*/
/**
 * Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
       
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                 
                ],
              ),
            ),
          ),
        ],
      ),
    );
 */
