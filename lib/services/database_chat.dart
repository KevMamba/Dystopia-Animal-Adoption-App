import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/foundation.dart';

import 'firestore_api.dart';
import 'firestore_service.dart';

abstract class Database {
  Future<QuerySnapshot> getUserByName(String name);

  Future getChatRoom(String chatroomID, Map<String, dynamic> data);

  //Future getAllConversations(String name);
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  @override
  Future<QuerySnapshot> getUserByName(String name) async {
    return await _service.usersByName(
        username: name, path: APIPath.userCollection());
  }

  @override
  Future getChatRoom(String chatroomID, Map<String, dynamic> data) async {
    return await _service.getChatRoom(
        path: APIPath.chatCollection(), chatRoomID: chatroomID, data: data);
  }
}
