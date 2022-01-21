import 'package:flutter/material.dart';
import 'package:the_social/auth_pages/signup.dart';
import 'package:the_social/routes.dart';

class NewsFeed extends StatefulWidget {
  NewsFeed({Key? key}) : super(key: key);

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          child: Text(
            "News Feed Page",
            style: TextStyle(fontSize: 28),
          ),
          onTap: () => Navigator.pushNamed(context, MyRoutes.signup),
        ),
      ),
    );
  }
}
