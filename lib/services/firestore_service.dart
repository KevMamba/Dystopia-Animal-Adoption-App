import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dystopia_flutter_app/services/firestore_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  Future<void> addUser({
    @required String username,
    @required String email,
    @required String photo,
  }) async {
    final reference =
        FirebaseFirestore.instance.collection(APIPath.userCollection());
    reference.where("email", isEqualTo: email).snapshots().listen((data) async {
      if (data.docs.length == 0) {
        Map<String, String> data = {
          'name': username,
          'email': email,
          'photo': photo
        };
        await reference.add(data);
      } else {
        return;
      }
    });
  }

  Future usersByName({
    @required String username,
    @required String path,
  }) async {
    final reference = FirebaseFirestore.instance.collection(path);
    return await reference.where('name', isEqualTo: 'username').get();
  }

  Future<void> getChatRoom({
    @required String path,
    @required String chatRoomID,
    @required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.collection(path);
    return await reference.doc(chatRoomID).set(data);
  }

  Future<void> sendMessage(
      {@required String path,
      @required String chatroomID,
      @required Map<String, dynamic> messageMap}) async {
    final reference = FirebaseFirestore.instance.collection(path);
    await reference
        .doc(chatroomID)
        .collection(APIPath.conversations())
        .add(messageMap);
  }

  Future getConversation(
      {@required String path, @required String chatroomID}) async {
    final reference = FirebaseFirestore.instance.collection(path);
    return reference
        .doc(chatroomID)
        .collection(APIPath.conversations())
        .orderBy('date')
        .snapshots();
  }

  Future getUserChats(String username, String path) async {
    final reference = FirebaseFirestore.instance.collection(path);
    return reference.where('users', arrayContains: username).snapshots();
  }
}
