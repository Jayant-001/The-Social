import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/services.dart';
import 'package:the_social/auth_pages/common_Widgets.dart';
import 'package:the_social/auth_pages/login.dart';
import 'package:the_social/chat/constants.dart';
import 'package:the_social/routes.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pwd = TextEditingController();
  final TextEditingController _conformPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

            // backgroundColor: const Color.fromRGBO(34, 48, 60, 1),
            backgroundColor: Colors.white,
            body: Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Welcome to The Social",
                      style: TextStyle(fontSize: 28, color: mainColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 100,
                      child: Image.asset(
                        'assets/images/wel.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                    child: Form(
                        key: _signUpKey,
                        child: ListView(
                          children: [
                            textInputField(
                                hintText: "Full Name",
                                validator: (String? inputVal) {
                                  if (inputVal!.length < 3) {
                                    return "Enter a valid name";
                                  }
                                  return null;
                                },
                                textEditingController: _name),
                            textInputField(
                                hintText: "Email",
                                validator: (String? inputVal) {
                                  if (!RegExp(
                                          "^[a-zA-z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(inputVal!)) {
                                    return "Please enter a valid email";
                                  }
                                  return null;
                                },
                                textEditingController: _email),
                            textInputField(
                                hintText: "Password",
                                validator: (String? inputVal) {
                                  if (inputVal!.length < 6) {
                                    return "Password should be minimum 6 character";
                                  }
                                  return null;
                                },
                                textEditingController: _pwd),
                            textInputField(
                                hintText: "Confirm Password",
                                validator: (String? inputVal) {
                                  if (inputVal!.length < 6) {
                                    return "Confirm Password should be minimum 6 character";
                                  }
                                  return null;
                                },
                                textEditingController: _conformPwd),
                            signUpAuthButton(context, "Sign Up"),
                          ],
                        )),
                  ),
                  Center(
                    child:
                        Text("Or Signup with", style: TextStyle(fontSize: 18)),
                  ),
                  googleLogin(context),
                  goToLogIn(context, "Existing user? ", "Log In")
                ],
              ),
            )));
  }

  Widget signUpAuthButton(BuildContext context, String buttonName) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width - 60, 30.0),
            elevation: 5.0,
            // primary: Color.fromRGBO(57, 60, 80, 1),
            primary: mainColor,
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 7.0,
              bottom: 7.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            )),
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 25.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: () async {
          if (this._signUpKey.currentState!.validate()) {
            print('Validated');

            // if (mounted) {
            //   setState(() {
            //     this._isLoading = true;
            //   });
            // }

            // SystemChannels.textInput.invokeMethod('TextInput.hide');

            // final EmailSignUpResults response = await this
            //     ._emailAndPasswordAuth
            //     .signUpAuth(email: this._email.text, pwd: this._pwd.text);
            // if (response == EmailSignUpResults.SignUpCompleted) {
            //   Navigator.push(
            //       context, MaterialPageRoute(builder: (_) => LogInScreen()));
            // } else {
            //   final String msg =
            //       response == EmailSignUpResults.EmailAlreadyPresent
            //           ? 'Email Already Present'
            //           : 'Sign Up Not Completed';
            //   ScaffoldMessenger.of(context)
            //       .showSnackBar(SnackBar(content: Text(msg)));
            // }
          } else {
            print('Not Validated');
          }

          // if (mounted) {
          //   setState(() {
          //     this._isLoading = false;
          //   });
          // }
        },
      ),
    );
  }
}
