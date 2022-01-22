import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_social/chat/constants.dart';

//_________________________TO ENLARGE THE IMAGE_____________________________

class ImageScreen extends StatefulWidget {
  ImageScreen({Key? key, required this.urlimg, required this.title})
      : super(key: key);
  String urlimg;
  String title;
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: chatPrimaryColor,
        elevation: 0,
        leading: BackButton(),
        title: Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),maxLines: 2,textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(onPressed: () => editimg(context), icon: Icon(Icons.edit)),
          SizedBox(
            width: 10,
          ),
          IconButton(onPressed: () => share(context), icon: Icon(Icons.share))
        ],
      ),
      body: Card(
        child: Center(
          child: Container(
              alignment: Alignment.center,
              height: 400,
              width: 400,
              color: Colors.white,
              child: DecoratedBox(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(
                    widget.urlimg,
                    fit: BoxFit.fill,
                  ))),
        ),
      ),
    );
  }
}





Future editimg(BuildContext context) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) => Center(
      child: Card(
        color: Colors.white,
        child: Container(
          height: 120,
          width: 300,
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black,
                ),
                title: Text("Camera",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                onTap: () {
                  getimg(ImageSource.camera, context);
                },
              ),
              ListTile(
                leading: Icon(Icons.image_outlined, color: Colors.black),
                title: Text(
                  "Select from Gallery",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                onTap: () {
                  getimg(ImageSource.gallery, context);
                },
              )
            ],
          ),
        ),
      ),
    ),
  );
}

//__________________________Function to select image_______________________________

File? image;
Future getimg(ImageSource source, BuildContext context) async {
  try {
    final image = (await ImagePicker().pickImage(source: source));
    if (image == null) return;

    final imagetemp = File(image.path);
    // setState(() {
    //   this.image = imagetemp;
    //   t = 1;
    //   print("image captured");
    // });
  } on PlatformException catch (e) {
    // TODO
    print("Permission denied");
  }
  Navigator.of(context).pop();
}

//_______________Function to upload image on firebase_________________________

//  Future uploadfile() async {
//     if (image == null) return;
//     final filename = basename(image!.path);
//     final dest = 'images/$filename';
//     FirebaseApi.uploadfile(dest, image!);
//     task = FirebaseApi.uploadfile(dest, image!);
//     setState(() {});
//     if (task == null) return;
//     final snapshot = await task!.whenComplete(() {});
//     final urldownload = await snapshot.ref.getDownloadURL();
//     print(urldownload);
//     updatedpurl(urldownload, currUser.name, currUser.email, currUser.password,
//         currUser.uid);
//   }

Future share(BuildContext context) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return Center(
          child: Card(
        child: Container(
          height: 120,
          width: 300,
          child: Text(
            "Share",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ));
    },
  );
}
