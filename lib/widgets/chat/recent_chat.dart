import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dystopia_flutter_app/screens/chat/chat.dart';
import 'package:dystopia_flutter_app/services/auth.dart';
import 'package:dystopia_flutter_app/services/database_chat.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';

import 'package:flutter/material.dart';

class RecentChats extends StatefulWidget {
  final User user;
  final FirestoreDatabase database;

  const RecentChats({Key key, this.user, this.database}) : super(key: key);
  @override
  _RecentChatsState createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  Stream<QuerySnapshot> chats;
  @override
  void initState() {
    widget.database.getUserChats(widget.user.displayName).then((value) {
      setState(() {
        chats = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(
            stream: chats,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 2,
                        );
                      },
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return _chatTile(
                            context: context,
                            ownerName: snapshot.data.documents[index]
                                .data()['users'][1],
                            chatroomID: snapshot.data.documents[index]
                                .data()['chatRoomId']);
                      },
                    )
                  : Center(
                      child: Text("LETS GET STARTED"),
                    );
            }));
  }

  _getOwner(String ownerName) {
    User owner = User(
        uid: 'asas',
        photoUrl: 'assets/images/sophia.jpg',
        displayName: 'Sophia',
        emailId: 'owner@gmail.com');
    return owner;
  }

  _chatTile({BuildContext context, String ownerName, String chatroomID}) {
    User owner = _getOwner(ownerName);
    return GestureDetector(
      onTap: () {
        PlatformPageRoute.pageRoute(
            fullScreen: false,
            widget: ChatScreen(
              owner: owner,
              sender: widget.user,
              database: widget.database,
              chatID: chatroomID,
            ),
            fromRoot: false,
            context: context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 35.0,
                  backgroundImage: AssetImage(owner.photoUrl),
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      owner.displayName,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    //Container(
                    //  width: ScreenUtil().screenWidth * 0.3,
                    //  child: Text(
                    //    chat.text,
                    //    style: TextStyle(
                    //      color: Colors.blueGrey,
                    //      fontSize: 15.0,
                    //      fontWeight: FontWeight.w600,
                    //    ),
                    //    overflow: TextOverflow.ellipsis,
                    //  ),
                    //),
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                //   Text(
                //     'time',
                //     style: TextStyle(
                //       color: Colors.grey,
                //       fontSize: 15.0,
                //       fontWeight: FontWeight.bold,
                //    ),
                //  ),
                SizedBox(height: 5.0),
                /**
                *  chat.unread
                    ? Container(
                        width: 40.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryVariant,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'NEW',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Text(''),
                */
              ],
            ),
          ],
        ),
      ),
    );
  }
}
