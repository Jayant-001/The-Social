import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:the_social/auth_pages/login.dart';
import 'package:the_social/auth_pages/signup.dart';
import 'package:the_social/chat/constants.dart';
import 'package:the_social/news_feed/general_widget.dart';
import 'package:the_social/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewsFeed extends StatefulWidget {
  NewsFeed({Key? key}) : super(key: key);

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    String txt =
        "MCU's one of the epic moment Tony Stark tricks Thanos by taking not the new Infinity Gauntlet, but the Infinity Stones themselves, which slide into slots on his armor. He snaps his fingers and erases Thanos and his army — but Tony dies in the process.";
    return Scaffold(
        backgroundColor: Colors.white,
        // body: Center(
        //   child: GestureDetector(
        //     child: Text(
        //       "News Feed Page",
        //       style: TextStyle(fontSize: 28),
        //     ),
        //     onTap: () => Navigator.pushNamed(context, MyRoutes.signup),
        //   ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 15,
              ),
              Card(
                elevation: 10,
                // color: Colors.black,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(3, 8, 8, 8),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "People you may know",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      storyview()
                    ]),
              ),
              Post(caption: "1 " + txt, img: "assets/images/iron.jfif"),
              Post(caption: "2 " + txt, img: "assets/images/panth.jfif"),
              Post(caption: "3 " + txt, img: "assets/images/capt.jfif"),
              Post(caption: "4 " + txt, img: "assets/images/black.jfif"),
              Post(caption: "5 " + txt, img: "assets/images/hawk.jfif"),
              Post(caption: "6 " + txt, img: "assets/images/meme.jfif"),
              Post(caption: "7 " + txt, img: "assets/images/roman.jfif"),
              Post(caption: "8 " + txt, img: "assets/images/tony.jfif"),
              Post(caption: "9 " + txt, img: "assets/images/wanda.jfif"),
              Post(img: "assets/images/schlogo.png"),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
