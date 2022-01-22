import 'package:flutter/material.dart';
import 'package:the_social/chat/constants.dart';
import 'package:the_social/profile_page/general_function.dart';
import 'dart:ui';
import 'package:the_social/profile_page/general_widget.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    String username = "User 1";
    String college = "KIET GROUP OF INSTITUITION";
    var imgdp = "assets/images/dp.jfif";
    int followernum = 57;
    int followingnum = 80;
    int postnum = 23;
    String about = "Hello everyone this is myself. I am xyz enthusiast";
    String live = "Fatehgarh";
    String mail = "user@try.com";
    String work = "Delhi";
    String dob = "05 August";
    String school = "KENDRIYA VIDYALAYA RRC FATEHGARH";
    List educ = ['educ 1', 'educ 2', 'educ 3', 'educ 4', 'educ 5', 'educ 6'];
    List hobbie = ['hbb1', 'hbb2', 'hbb3', 'hbb4', 'hbb5'];
    List interest = [
      'interest1',
      'interest2',
      'interest3',
      'interest4',
      'interest5'
    ];
    final clglogo = AssetImage("assets/images/clglogo.png");
    final schlogo = AssetImage("assets/images/schlogo.png");
    var imgbackg = "assets/images/wel.png";

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Color.fromRGBO(57, 60, 88, 1),
      //   title: Center(
      //       child: Text("Profile",
      //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28))),
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.white,
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Column(children: [
                          Container(
                            height: 150,
                            width: 400,
                            color: Colors.amberAccent,
                            child: GestureDetector(
                              child: Image.asset(
                                imgbackg,
                                fit: BoxFit.cover,
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImageScreen(
                                      urlimg: imgbackg,
                                      title: "Background Image",
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ]),
                        Positioned(
                            bottom: 0,
                            right: 125,
                            child: ClipOval(
                              child: GestureDetector(
                                onTap: () {
                                  print("Enlarge Image");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ImageScreen(
                                          urlimg: imgdp,
                                          title: "Profile Image",
                                        ),
                                      ));
                                  //here gove functionality to enlarge image
                                },
                                child: Material(
                                  child: Image.asset(
                                    imgdp,
                                    height: 128,
                                    width: 128,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            )),
                        Positioned(
                            bottom: 0,
                            right: 125,
                            child: ClipOval(
                              child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(3),
                                child: ClipOval(
                                    child: Container(
                                        padding: EdgeInsets.all(8),
                                        color: Colors.blue,
                                        child: GestureDetector(
                                          child: Icon(
                                            Icons.edit,
                                            size: 24,
                                            color: Colors.white,
                                          ),
                                          onTap: () {
                                            print("Edit Image");
                                            editimg(context);

                                            //here give functionality to edit image
                                          },
                                        ))),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(username,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.7))),
                        SizedBox(
                          height: 10,
                        ),
                        Text(college,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.7))),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Flutter Developer",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                            Row(mainAxisSize: MainAxisSize.min, children: [
                              SizedBox(
                                height: 16,
                                width: 5,
                                child: VerticalDivider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                                width: 5,
                                child: VerticalDivider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              )
                            ]),
                            Text(
                              "Android Developer",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                showfpf(num: followernum, text: "Followers"),
                                SizedBox(
                                  width: 40,
                                  height: 30,
                                  child: VerticalDivider(
                                      color: Colors.black, thickness: 2),
                                ),
                                Center(
                                    child:
                                        showfpf(num: postnum, text: "Posts")),
                                SizedBox(
                                  width: 40,
                                  height: 30,
                                  child: VerticalDivider(
                                    color: Colors.black,
                                    thickness: 2,
                                  ),
                                ),
                                showfpf(num: followingnum, text: "Following")
                              ],
                            ),
                          ),
                        )
                        //here you can add button to upload image
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //________________Card for About_______________
            Card(
              elevation: 5,
              shadowColor: Colors.black,
              color: Colors.white,
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    tilehead(text: "About :-"),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        about,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //_________________________Card for personal info_________________________

            Card(
              elevation: 5,
              shadowColor: Colors.black,
              color: Colors.white,
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(children: [
                  tilehead(text: "Personal Info :-"),
                  tileview(text: username, ic: Icons.account_circle),
                  tileview(text: live, ic: Icons.location_pin),
                  tileview(text: mail, ic: Icons.email_outlined),
                  tileview(text: work, ic: Icons.work_rounded),
                  tileview(text: dob, ic: Icons.cake_rounded),
                ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //________________________Card for education____________________________

            Card(
              elevation: 5,
              shadowColor: Colors.black,
                color: Colors.white,
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(children: [
                      tilehead(text: "Education :-"),
                      Icontileview(txt: college, img: clglogo),
                      Icontileview(txt: school, img: schlogo)
                    ]))),
            SizedBox(
              height: 20,
            ),

            //__________________________________Education details___________________________________

            CardView(head: "Education", data: educ),
            SizedBox(
              height: 20,
            ),

            //__________________________Card for interest_________________________

            CardView(head: "Interest :-", data: interest),
            SizedBox(
              height: 20,
            ),

//_____________________________Card for hobbies___________________________________

            CardView(head: "Hobbies :-", data: hobbie),
            SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     alignment: Alignment.center,
            //     child: Text(
            //       "Developed by Prashant & Jayant & Priyanka",
            //       style: TextStyle(
            //           fontSize: 22,
            //           fontWeight: FontWeight.normal,
            //           color: Colors.white),
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.greenAccent[400],
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            "Developed by Prashant & Jayant & Priyanka",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        alignment: Alignment.topCenter,
      ),
    );
  }
}

