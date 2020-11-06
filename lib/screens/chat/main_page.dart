import 'package:dystopia_flutter_app/widgets/chat/recent_chat.dart';
import 'package:dystopia_flutter_app/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class ChatHome extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      header: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: TabBar(
                unselectedLabelColor: Colors.white70,
                labelColor: Colors.white,
                tabs: [
                  new Tab(
                    child: Text(
                      'Chats',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  new Tab(
                    child: Text(
                      'Requests',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
                controller: _tabController,
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
              ),
            )
          ],
        ),
      ),
      body: TabBarView(
        children: [
          RecentChats(),
          Center(
            child: Text(
              "You've no requests yet..",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
        controller: _tabController,
      ),
      searchBar: false,
    );
  }
}
