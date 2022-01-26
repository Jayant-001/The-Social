import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_social/chat/constants.dart';
import 'package:the_social/routes.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text(
            "Settings Page",
          ),
        ),
        ActionChip(
          label: Text(
            "Logout",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: chatPrimaryColor,
          onPressed: () => logout(context),
        ),
      ]),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, MyRoutes.login);
  }
}
