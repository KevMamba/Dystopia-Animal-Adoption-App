import 'package:dystopia_flutter_app/services/auth.dart';
import 'package:dystopia_flutter_app/services/database_chat.dart';

class ChatsBlock {
  final FirestoreDatabase firestoreDatabase;
  final User user;
  ChatsBlock(this.firestoreDatabase, this.user);
}
