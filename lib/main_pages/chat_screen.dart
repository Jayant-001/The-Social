// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:the_social/chat/components/chatBody.dart';
import 'package:the_social/chat/constants.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatAppBar(),
      drawer: Drawer(),
      body: ChatBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: chatPrimaryColor,
        child: Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
    );
  }

  AppBar chatAppBar() {
    return AppBar(
      backgroundColor: chatPrimaryColor,
      bottomOpacity: 0.0,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      leading: BackButton(),
      title: Text("CHATS"),
      actions: [
        IconButton(
            onPressed: () {
              print("search button");
              showSearch(context: context, delegate: UserSearch());
            },
            icon: Icon(Icons.search)),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
        SizedBox(
          width: chatPadding / 3,
        )
      ],
    );
  }
}

class UserSearch extends SearchDelegate<String> {
  final users = [
    "jayant",
    "priyanka",
    "tanika",
    "prashant",
    "anubhaw",
    "jayant",
    "priyanka",
    "tanika",
    "prashant",
    "anubhaw",
    "jayant",
    "priyanka",
    "tanika",
    "prashant",
    "anubhaw",
    "jayant",
    "priyanka",
    "tanika",
    "prashant",
    "anubhaw",
    "jayant",
    "priyanka",
    "tanika",
    "prashant",
    "anubhaw",
  ];

  final recentsUsers = [
    "jayant",
    "aman",
    "priyanka",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // left leading icon
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show some users
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.red,
          shape: StadiumBorder(),
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentsUsers
        : users.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.person),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey),
              )
            ])),
      ),
      itemCount: suggestionList.length,
    );

    throw UnimplementedError();
  }
}
