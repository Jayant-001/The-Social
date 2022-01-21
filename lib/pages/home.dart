import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:the_social/chat/constants.dart';
import 'package:the_social/main_pages/chat_screen.dart';
import 'package:the_social/main_pages/favourite_page.dart';
import 'package:the_social/main_pages/news_feed.dart';
import 'package:the_social/main_pages/profile_page.dart';
import 'package:the_social/main_pages/search_page.dart';
import 'package:the_social/main_pages/settings_page.dart';
import 'package:the_social/routes.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 2;

  final screens = [
    NewsFeed(),
    SearchPage(),
    FavouritePage(),
    SettingsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.search, size: 30),
      Icon(Icons.favorite, size: 30),
      Icon(Icons.settings, size: 30),
      Icon(Icons.person, size: 30),
    ];

    return ClipRect(
      child: Scaffold(
          appBar: homeAppBar(),
          extendBody: true,
          backgroundColor: Colors.white,
          // appBar: AppBar(
          //   title: Text('Home Page'),
          //   elevation: 0,
          //   centerTitle: true,
          // ),
          body: screens[index],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              iconTheme: IconThemeData(color: Colors.white),
            ),
            child: CurvedNavigationBar(
              color: mainColor,
              backgroundColor: Colors.transparent,
              height: 60.0,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 300),
              index: index,
              items: items,
              onTap: (index) => setState(() => this.index = index),
            ),
          )),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      backgroundColor: mainColor,
      // bottomOpacity: 0.0,
      // elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Text("The Social"),
      actions: [
        // IconButton(
        //     onPressed: () {
        //       print("search button");
        //       showSearch(context: context, delegate: UserSearch());
        //     },
        //     icon: Icon(Icons.search)),
        IconButton(
          icon: Icon(Icons.message),
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.chatPage);
          },
        ),
        SizedBox(
          width: chatPadding / 3,
        )
      ],
    );
  }
}
