import 'package:flutter/material.dart';
import 'package:the_social/routes.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          child: Text("Search Page"),
          onTap: () => Navigator.pushNamed(context, MyRoutes.login),
        ),
      ),
    );
  }
}
