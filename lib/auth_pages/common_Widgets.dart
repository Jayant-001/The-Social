import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:the_social/auth_pages/login.dart';
import 'package:the_social/auth_pages/signup.dart';
import 'package:the_social/chat/constants.dart';

Widget textInputField(
    {required String hintText,
    required String? Function(String?)? validator,
    required TextEditingController textEditingController}) {
  return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
      child: TextFormField(
        controller: textEditingController,
        validator: validator,
        style: TextStyle(),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: mainColor, width: 2.0))),
      ));
}

Widget signUpButton(BuildContext context, String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width - 60, 30.0),
          elevation: 5.0,
          // primary: Color.fromRGBO(57, 60, 88, 1),
          primary: mainColor,
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 7.0,
            bottom: 7.0,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)))),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25.8,
          letterSpacing: 1.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      onPressed: () async {},
    ),
  );
}

Widget googleLogin(BuildContext context) {
  return Container(
    width: double.maxFinite,
    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () => {print("Google login")},
          child: Image.asset(
            'assets/images/google.png',
            width: 40.0,
          ),
        ),
      ],
    ),
  );
}

Widget goToLogIn(BuildContext context, String text1, String text2) {
  return ElevatedButton(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(
            // color: Colors.white,
            color: Colors.black,
            fontSize: 16.0,
            letterSpacing: 1.0,
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            // color: Colors.lightBlueAccent,
            color: mainColor,
            fontSize: 16.0,
            letterSpacing: 1.0,
          ),
        ),
      ],
    ),
    style: ElevatedButton.styleFrom(
        elevation: 0.0,
        // primary: Color.fromRGBO(34, 48, 60, 1),
        primary: Colors.white),
    onPressed: () {
      if (text2 == "Log In") {
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => SignUpPage()));
      }
    },
  );
}
