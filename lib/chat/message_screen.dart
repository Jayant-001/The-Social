import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:the_social/chat/components/messageBody.dart';
import 'package:the_social/chat/constants.dart';

class ChatMessagePage extends StatefulWidget {
  ChatMessagePage({Key? key}) : super(key: key);

  @override
  _ChatMessagePageState createState() => _ChatMessagePageState();
}

class _ChatMessagePageState extends State<ChatMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatMessageAppBar(),
      body: ChatMessageBody(),
    );
  }

  AppBar chatMessageAppBar() {
    return messageAppBar();
  }

  AppBar messageAppBar() {
    return AppBar(
      leading: BackButton(),
      backgroundColor: chatPrimaryColor,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          SizedBox(
            width: chatPadding * 0.75,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jayant Gupta",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active 3m ago",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.local_phone)),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.videocam,
            )),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        SizedBox(
          width: 1,
        )
      ],
    );
  }
}
