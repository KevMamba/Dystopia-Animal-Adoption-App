import 'package:dystopia_flutter_app/data/chat/room_id.dart';
import 'package:dystopia_flutter_app/screens/chat/chat.dart';
import 'package:dystopia_flutter_app/services/auth.dart';
import 'package:dystopia_flutter_app/services/database_chat.dart';
import 'package:dystopia_flutter_app/services/firestore_service.dart';
import 'package:dystopia_flutter_app/widgets/helper_buttons.dart';
import 'package:dystopia_flutter_app/widgets/persistent_header.dart';
import 'package:dystopia_flutter_app/widgets/platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';

class PetResultScreen extends StatefulWidget {
  final String petPic;
  final User user;
  final FirestoreDatabase database;
  const PetResultScreen({Key key, this.petPic, this.user, this.database})
      : super(key: key);
  @override
  State createState() => new PetResultScreenState();
}

class PetResultScreenState extends State<PetResultScreen> {
  List<String> users;
  @override
  void initState() {
    super.initState();
  }

  _addOwnerToDatabase(User owner) async {
    final reference = FirestoreService.instance;
    await reference.addUser(
      username: owner.displayName,
      email: owner.emailId,
      photo: owner.photoUrl,
    );
  }

  Widget ownerBox() {
    User owner = new User(
        uid: 'asas',
        photoUrl: 'assets/images/sophia.jpg',
        displayName: 'Sophia',
        emailId: 'sophia@gmail.com');
    _addOwnerToDatabase(owner);
    return Material(
      elevation: 4,
      type: MaterialType.canvas,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: GroovinExpansionTile(
        initiallyExpanded: false,
        defaultTrailingIconColor: Theme.of(context).disabledColor,
        inkwellRadius: BorderRadius.circular(15),
        leading: CircleAvatar(
          backgroundImage: AssetImage(owner.photoUrl),
          radius: 22.0,
        ),
        title: Text(
          owner.displayName,
        ),
        subtitle: Text(
          "Owner",
        ),
        boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et odio pellentesque diam volutpat commodo sed egestas. Ac turpis egestas maecenas pharetra convallis posuere morbi leo urna.",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Tooltip(
                message: "Chat",
                child: IconButton(
                    icon: Icon(
                      Icons.chat_bubble,
                      color: Colors.white,
                    ),
                    color: Colors.black,
                    onPressed: () async {
                      users = [widget.user.displayName, owner.displayName];
                      String chatRoomId = ChatRoomDetails.getChatRoomId(
                        widget.user.emailId,
                        owner.emailId,
                      );
                      Map<String, dynamic> chatRoom = {
                        "chatRoomId": chatRoomId,
                        "users": users,
                      };
                      await widget.database.getChatRoom(chatRoomId, chatRoom);
                      PlatformPageRoute.pageRoute(
                          fullScreen: false,
                          widget: ChatScreen(
                            chatID: chatRoomId,
                            owner: owner,
                            sender: widget.user,
                            database: widget.database,
                          ),
                          fromRoot: false,
                          context: context);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scrollbar(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: PersistentHeader(context: context, petPic: widget.petPic),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              top: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                left: 15.0,
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Filters",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        controller: new ScrollController(),
                        padding: EdgeInsets.all(5),
                        children: <Widget>[
                          FilterCategory("Female", false),
                          FilterCategory("Golden\nRetriever", false),
                          FilterCategory("3 months", false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15,
              ),
              child: ownerBox(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20,
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et odio pellentesque diam volutpat commodo sed egestas. Ac turpis egestas maecenas pharetra convallis posuere morbi leo urna.",
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height / 10,
            ),
          )
        ],
      ),
    ));
  }
}
