class ChatRoomDetails {
  static getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\__$a";
    } else {
      return "$a\__$b";
    }
  }
}
