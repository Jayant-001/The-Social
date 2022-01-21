import 'package:flutter/material.dart';
import 'package:the_social/chat/message_screen.dart';
import 'package:the_social/chat/components/filled_outline_button.dart';
import 'package:the_social/chat/constants.dart';
import 'package:the_social/chat/models/Chat.dart';

class ChatBody extends StatefulWidget {
  ChatBody({Key? key}) : super(key: key);

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  // late Key key;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   padding:
        //       EdgeInsets.fromLTRB(chatPadding, 0, chatPadding, chatPadding),
        //   color: chatPrimaryColor,
        //   child: Row(
        //     children: [
        //       FillOutlineButton(
        //         press: () {},
        //         text: "Recent Message",
        //         key: const Key("dkj"),
        //       ),
        //       const SizedBox(width: chatPadding),
        //       FillOutlineButton(
        //           key: const Key("ldkj"),
        //           press: () {},
        //           text: "Active",
        //           isFilled: false),
        //     ],
        //   ),
        // ),
        Expanded(
            child: ListView.builder(
                itemCount: chatsData.length,
                itemBuilder: (context, index) => SignleChatRow(
                      chat: chatsData[index],
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatMessagePage()));
                      },
                    ))),
      ],
    );
  }
}

class SignleChatRow extends StatelessWidget {
  const SignleChatRow({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  final Chat chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: chatPadding, vertical: chatPadding * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(chat.image),
                ),
                if (chat.isActive)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                          color: chatPrimaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              width: 3)),
                    ),
                  )
              ],
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: chatPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),
                  Text(
                    chat.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )),
            Opacity(
              opacity: 0.64,
              child: Text(chat.time),
            ),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
