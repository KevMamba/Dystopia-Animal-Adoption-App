import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dystopia_flutter_app/services/auth.dart';
import 'package:dystopia_flutter_app/services/database_chat.dart';
import 'package:dystopia_flutter_app/widgets/custom_scaffold.dart';
import 'package:dystopia_flutter_app/widgets/helper_buttons.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final User owner;
  final User sender;
  final FirestoreDatabase database;
  final String chatID;

  ChatScreen({
    this.owner,
    this.chatID,
    this.sender,
    this.database,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = new TextEditingController();
  Stream<QuerySnapshot> conversation;
  @override
  void initState() {
    widget.database.getChat(widget.chatID).then((value) {
      setState(() {
        conversation = value;
      });
    });
    super.initState();
  }

  _buildConversation() {
    return Expanded(
      child: StreamBuilder(
        stream: conversation,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return _messageTile(
                      message: snapshot.data.documents[index].data()["message"],
                      time: snapshot.data.documents[index].data()["date"],
                      isMe: widget.sender.displayName ==
                          snapshot.data.documents[index].data()["sentBy"],
                    );
                  })
              : Center(
                  child: Text("GET STARTED"),
                );
        },
      ),
    );
  }

  _messageTile({String message, bool isMe, int time}) {
    var date = DateTime.fromMillisecondsSinceEpoch(time);
    var formattedDate = DateFormat.yMMMEd().format(date);
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe
            ? Theme.of(context).colorScheme.primaryVariant
            : Theme.of(context).colorScheme.primary,
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            formattedDate.toString(),
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            message,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        FavoriteButton(),
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).colorScheme.primary,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: _messageController,
              onChanged: (value) {},
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
            ),
            iconSize: 25.0,
            color: Theme.of(context).colorScheme.primary,
            onPressed: () async {
              if (_messageController.text.isNotEmpty) {
                Map<String, dynamic> messageMap = {
                  "message": _messageController.text,
                  "sentBy": widget.sender.displayName,
                  "date": DateTime.now().millisecondsSinceEpoch,
                };
                await widget.database.sendMessage(
                  widget.chatID,
                  messageMap,
                );
                setState(() {
                  _messageController.text = "";
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.chevron_left,
                  size: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(width: 60),
              CircleAvatar(
                radius: 35.0,
                backgroundImage: AssetImage(widget.owner.photoUrl),
              ),
              SizedBox(width: 10),
              Text(
                widget.owner.displayName,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
              ),
              Opacity(
                opacity: 1,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        children: <Widget>[
          _buildConversation(),
          _buildMessageComposer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: _body(),
      searchBar: false,
      header: _header(),
    );
  }
}
