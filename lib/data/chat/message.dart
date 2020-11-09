import 'package:dystopia_flutter_app/services/auth.dart';

class Message {
  final User sender;
  final String time; // DateTime or Firebase Timestamp
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  uid: '0',
  displayName: 'Current User',
  photoUrl: 'assets/images/greg.jpg',
  emailId: 'asfa',
);

// USERS
final User greg = User(
  uid: '1',
  displayName: 'Greg',
  photoUrl: 'assets/images/greg.jpg',
  emailId: 'asfa',
);
final User james = User(
  uid: '2',
  displayName: 'James',
  photoUrl: 'assets/images/james.jpg',
  emailId: 'asfa',
);
final User john = User(
  uid: '3',
  displayName: 'John',
  photoUrl: 'assets/images/john.jpg',
  emailId: 'asfa',
);
final User olivia = User(
  uid: '4',
  displayName: 'Olivia',
  photoUrl: 'assets/images/olivia.jpg',
  emailId: 'asfa',
);
final User sam = User(
  uid: '5',
  displayName: 'Sam',
  photoUrl: 'assets/images/sam.jpg',
  emailId: 'asfa',
);
final User sophia = User(
  uid: '6',
  displayName: 'Sophia',
  photoUrl: 'assets/images/sophia.jpg',
  emailId: 'asfa',
);
final User steven = User(
  uid: '7',
  displayName: 'Steven',
  photoUrl: 'assets/images/steven.jpg',
  emailId: 'asfa',
);

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];
