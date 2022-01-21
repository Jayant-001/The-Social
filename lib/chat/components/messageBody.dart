// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:the_social/chat/constants.dart';
import 'package:the_social/chat/models/ChatMessage.dart';

class ChatMessageBody extends StatefulWidget {
  ChatMessageBody({Key? key}) : super(key: key);

  @override
  ChatMessageBodyState createState() => ChatMessageBodyState();
}

class ChatMessageBodyState extends State<ChatMessageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: chatPadding),
          child: ListView.builder(
            itemCount: demoChatMessages.length,
            itemBuilder: (context, index) => Messages(
              message: demoChatMessages[index],
            ),
          ),
        )),
        chatInputField(context),
      ],
    );
  }

  Container chatInputField(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: chatPadding,
          vertical: chatPadding / 2,
        ),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFF087949).withOpacity(0.08),
                  blurRadius: 32,
                  offset: Offset(0, 4))
            ]),
        child: SafeArea(
          child: Row(
            children: [
              Icon(Icons.mic, color: chatPrimaryColor),
              SizedBox(
                width: chatPadding,
              ),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: chatPrimaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.sentiment_satisfied_alt_outlined,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.64),
                      ),
                      SizedBox(width: chatPadding - 8),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            hintText: "Type message", border: InputBorder.none),
                      ))
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.attach_file,
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.64),
              ),
              SizedBox(
                width: chatPadding / 4,
              ),
              Icon(
                Icons.camera_alt_outlined,
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.64),
              ),
            ],
          ),
        ));
  }
}

class Messages extends StatefulWidget {
  final ChatMessage message;
  Messages({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  // late ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: chatPadding),
      child: Row(
        mainAxisAlignment: widget.message.isSender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          ChatMessageText(
            message: widget.message,
          ),
        ],
      ),
    );
  }
}

class ChatMessageText extends StatelessWidget {
  final ChatMessage message;
  const ChatMessageText({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.only(top: chatPadding),
        padding: EdgeInsets.symmetric(
          horizontal: chatPadding * 0.75,
          vertical: chatPadding / 2,
        ),
        decoration: BoxDecoration(
            color: chatPrimaryColor.withOpacity(message.isSender ? 1 : 0.1),
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          message.text,
          style: TextStyle(
              color: message.isSender
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyText1!.color),
        ));
  }
}
