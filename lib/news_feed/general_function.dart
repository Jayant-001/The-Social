import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_social/chat/constants.dart';

class Storyscreen extends StatefulWidget {
  Storyscreen(
      {Key? key,
      required this.story,
      required this.username,
      required this.userimg})
      : super(key: key);
  String story;
  String username;
  String userimg;
  @override
  _StoryscreenState createState() => _StoryscreenState();
}

class _StoryscreenState extends State<Storyscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: chatPrimaryColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipOval(
            child: Image.asset(widget.userimg, fit: BoxFit.cover),
          ),
        ),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.username,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
            textAlign: TextAlign.start,
          ),
          Text(
            "24 January 06:32 AM",
            style: TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.start,
          )
        ]),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz_rounded)),
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.clear_rounded)),
        ],
      ),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            widget.story,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 10,
          child: Row(children: [
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Colors.white.withOpacity(0.4)),
              height: 40,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Send Message...",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              FontAwesomeIcons.solidHeart,
              color: Colors.red,
            ),
            SizedBox(
              width: 12,
            ),
            Icon(
              FontAwesomeIcons.solidLaugh,
              color: Colors.yellow,
            ),
            SizedBox(
              width: 12,
            ),
            Icon(
              FontAwesomeIcons.solidThumbsUp,
              color: Colors.blue,
            ),
            SizedBox(
              width: 12,
            ),
            Icon(
              FontAwesomeIcons.solidLaughBeam,
              color: Colors.yellow,
            )
          ]),
        ),
      ]),
    );
  }
}
