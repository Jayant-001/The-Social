import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_social/auth_pages/login.dart';
import 'package:the_social/main_pages/chat_screen.dart';
import 'package:the_social/routes.dart';
import 'package:the_social/pages/home.dart';

import 'package:the_social/auth_pages/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      themeMode: ThemeMode.light,
      routes: {
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.signup: (context) => SignUpPage(),
        MyRoutes.login: (context) => LoginPage(),
        MyRoutes.chatPage: (context) => ChatPage(),
      },
      initialRoute: MyRoutes.home,
      title: "The Social",
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.light,
      // home: SignUpPage(),
      // home: HomePage(),
    ),
  );
}
