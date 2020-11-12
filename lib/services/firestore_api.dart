class APIPath {
  static String userCollection() => '/users';
  static String user(String uid) => '/users/$uid';
  static String chatCollection() => '/ChatRoom';
  static String chatRoom(String chatID) => '/ChatRoom/$chatID';
}
