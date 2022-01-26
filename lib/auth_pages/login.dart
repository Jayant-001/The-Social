import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/services.dart';
import 'package:the_social/auth_pages/common_Widgets.dart';
import 'package:the_social/chat/constants.dart';
import 'package:the_social/pages/home.dart';
import 'package:the_social/routes.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            // backgroundColor: darkBodyColor,
            body: Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Welcome back to The Social",
                      style: TextStyle(fontSize: 26, color: mainColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: SizedBox(
                      height: 100,
                      child: Image.asset(
                        'assets/images/wel.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3.2,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
                    child: Form(
                        key: _loginKey,
                        child: ListView(
                          children: [
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
                            logInAuthButton(context, "Log In"),
                          ],
                        )),
                  ),
                  Center(
                    child: Text("Or Login with",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  googleLogin(context),
                  goToLogIn(context, "New User? ", "Register here"),
                ],
              ),
            )));
  }

  Widget logInAuthButton(BuildContext context, String buttonName) {
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
          onPressed: () => signIn(_email.text, _pwd.text)
          //  async {
          //   if (this._loginKey.currentState!.validate()) {
          //     print('Validated');
          // SystemChannels.textInput.invokeMethod('TextInput.hide');

          // if (mounted) {
          //   setState(() {
          //     this._isLoading = true;
          //   });
          // }

          // final EmailSignInResults emailSignInResults =
          //     await _emailAndPasswordAuth.signInWithEmailAndPassword(
          //         email: this._email.text, pwd: this._pwd.text);

          // String msg = '';
          // if (emailSignInResults == EmailSignInResults.SignInCompleted)
          //   Navigator.pushAndRemoveUntil(
          //       context,
          //       MaterialPageRoute(builder: (_) => TakePrimaryUserData()),
          //       (route) => false);
          // else if (emailSignInResults ==
          //     EmailSignInResults.EmailNotVerified) {
          //   msg =
          //       'Email not Verified.\nPlease Verify your email and then Log In';
          // } else if (emailSignInResults ==
          //     EmailSignInResults.EmailOrPasswordInvalid)
          //   msg = 'Email And Password Invalid';
          // else
          //   msg = 'Sign In Not Completed';

          // if (msg != '')
          //   ScaffoldMessenger.of(context)
          //       .showSnackBar(SnackBar(content: Text(msg)));

          // if (mounted) {
          //   setState(() {
          //     this._isLoading = false;
          //   });
          // }
          // } else {
          //   print('Not Validated');
          // }
          ),
    );
  }

  void signIn(String email, String password) async {
    if (this._loginKey.currentState!.validate()) {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(
                    msg: "Login Successfully",
                    backgroundColor: chatPrimaryColor),
                Navigator.pushNamed(context, MyRoutes.home), //
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e.toString());
      });
    }
  }
}
