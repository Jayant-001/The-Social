import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:the_social/chat/constants.dart';
import 'package:the_social/news_feed/general_function.dart';

class storyview extends StatefulWidget {
  const storyview({Key? key}) : super(key: key);

  @override
  _storyviewState createState() => _storyviewState();
}

class _storyviewState extends State<storyview> {
  @override
  Widget build(BuildContext context) {
    List<Widget> storylist = [
      storycard(
          imgadd: "assets/images/Video Place Here.png",
          userimgadd: "assets/images/user_5.png",
          username: "Vishu",
          context: context),
      storycard(
          imgadd: "assets/images/tony.jfif",
          userimgadd: "assets/images/user_2.png",
          username: "Jayant",
          context: context),
      storycard(
          imgadd: "assets/images/wanda.jfif",
          userimgadd: "assets/images/user_4.png",
          username: "Priyanka",
          context: context),
      storycard(
          imgadd: "assets/images/roman.jfif",
          userimgadd: "assets/images/user_3.png",
          username: "Aditya Kumar Singh Pal",
          context: context),
    ];
    //storylist.add(storycard());
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: storylist,
      ),
    );
  }

  // Widget storycard() {
  //   return Card(
  //     child: Column(
  //       children: [
  //         ListTile(
  //           leading: ClipOval(
  //             child: Material(
  //               child: Image.asset(
  //                 "assets/images/dp.jfif",
  //                 height: 128,
  //                 width: 128,
  //                 fit: BoxFit.fill,
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}

Widget storycard(
    {required var imgadd,
    required var userimgadd,
    required String username,
    required BuildContext context}) {
  return Card(
      child: Stack(
    alignment: Alignment.center,
    children: [
      GestureDetector(
          child: Container(
            width: 100,
            height: 150,
            child: Image.asset(
              imgadd,
              fit: BoxFit.cover,
            ),
          ),
          //________________add functionality to view story here_____________________
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Storyscreen(
                    story: imgadd,
                    username: username,
                    userimg: userimgadd,
                  ),
                ));
          }),
      Positioned(
        top: 5,
        left: 5,
        child: ClipOval(
          child: Image.asset(
            userimgadd,
            height: 30,
            width: 30,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
          bottom: 4,
          child: Container(
            alignment: Alignment.center,
            width: 100,
            child: Text(
              username,
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                //backgroundColor: Colors.black.withOpacity(0.3),
              ),
            ),
          ))
    ],
  ));
}

Widget Post({var caption, var img}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
      elevation: 5,
      shadowColor: Colors.black,
      child: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: ClipOval(
                child: Material(
                  child: Image.asset(
                    "assets/images/user_5.png",
                    height: 45,
                    width: 45,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Username",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      "24 January 06:13 AM",
                      style: TextStyle(color: Colors.black.withOpacity(0.5)),
                    ),
                    Icon(Icons.public, color: Colors.black.withOpacity(0.5))
                  ],
                ),
              ],
            ),
            Flexible(
                child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: double.infinity))),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  size: 30,
                )),
          ],
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: caption != null
              ? ReadMoreText(
                  caption,
                  trimMode: TrimMode.Line,
                  trimLines: 2,
                  trimCollapsedText: "see more",
                  trimExpandedText: "see less",
                  textAlign: TextAlign.start,
                  lessStyle: TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      color: chatPrimaryColor),
                  moreStyle: TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      color: chatPrimaryColor),
                  style: TextStyle(fontSize: 14),
                )
              : SizedBox(
                  height: 5,
                ),
        ),
        Container(
          child: img != null
              ? Image.asset(
                  img,
                  height: 250,
                  fit: BoxFit.cover,
                )
              : SizedBox(
                  height: 2,
                ),
        ),
        SizedBox(
          height: 7,
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(Icons.thumb_up_alt),
            Text("128"),
            Flexible(
                child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: double.infinity))),
            // Icon(Icons.comment_rounded),
            Text("470"),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.comment),
            SizedBox(
              height: 25,
              child: VerticalDivider(
                color: Colors.black,
                thickness: 2,
              ),
              width: 10,
            ),
            Text("234"),
            SizedBox(
              width: 5,
            ),
            Icon(FontAwesomeIcons.share),
            SizedBox(
              width: 5,
            )
          ],
        ),
        Divider(),
        Row(
          children: [
            Flexible(
                child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: double.infinity))),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(chatPrimaryColor)),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.thumb_up_alt_sharp,
                    ),
                    Text("Like")
                  ],
                )),
            Flexible(
                child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: double.infinity))),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(chatPrimaryColor)),
                onPressed: () {},
                child: Row(
                  children: [Icon(Icons.comment), Text("Comment")],
                )),
            Flexible(
                child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: double.infinity))),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(chatPrimaryColor)),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.shareSquare),
                    Text(" Share")
                  ],
                )),
            Flexible(
                child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: double.infinity))),
          ],
        )
      ]),
    ),
  );
}
