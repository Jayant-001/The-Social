import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_social/chat/constants.dart';

Widget showfpf({required int num, required String text}) {
  return Column(
    children: [
      Text(
        "$num",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      Text(text, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
    ],
  );
}

Widget tileview({required String text, required var ic}) {
  return ListTile(
      title: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
      leading: Icon(
        ic,
        size: 30,
      ));
}

Widget tilehead({required String text}) {
  return ListTile(
    leading: Text(text,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20)),
    trailing: GestureDetector(
      child: Icon(
        Icons.mode_edit_rounded,
        size: 24,
        color: Colors.black,
      ),
      onTap: () {
        print("Edit $text");
      },
    ),
  );
}

Widget rowview({required String text, required var ic}) {
  return Row(children: [
    Icon(
      ic,
      size: 24,
    ),
    SizedBox(
      width: 10,
    ),
    Text(
      text,
      style: TextStyle(
        fontSize: 16,
      ),
    ),
  ]);
}


Widget Icontileview({required String txt, required var img}) {
  return ListTile(
      title: Text(txt),
      leading: ClipOval(
        child: Material(
            child: Ink.image(
          image: img,
          height: 40,
          width: 40,
          fit: BoxFit.cover,
        )),
      ));
}

// _______________Functions to make bottomsheeta_______________________________________

// PersistentBottomSheetController<void> editimg(BuildContext context) {
//   return Scaffold.of(context).showBottomSheet<void>(
//     (BuildContext context) {
//       return Container(
//         height: 200,
//         color: Colors.transparent,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               const Text('BottomSheet'),
//               ElevatedButton(
//                   child: const Text('Close BottomSheet'),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   })
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// PersistentBottomSheetController editimg2(BuildContext context) {
//   return showBottomSheet(
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
//     backgroundColor: Colors.black.withOpacity(0.20),
//     context: context,
//     builder: (context) => Container(
//       height: 200,
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             const Text('BottomSheet'),
//             ElevatedButton(
//                 child: const Text('Close BottomSheet'),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 })
//           ],
//         ),
//       ),
//     ),
//   );
// }

//___________________________Card_View____________________________________________________

class Cardview extends StatefulWidget {
  Cardview(
      {Key? key,
      required this.head,
      required this.data,
      this.ismore = "See More",
      this.icontype = Icons.arrow_drop_down_outlined})
      : super(key: key);
  String head;
  List data;
  String ismore;
  IconData icontype;
  @override
  _CardviewState createState() => _CardviewState();
}

List<Widget> fetchtiles(List<Widget> lst, int l, List dat) {
  for (int i = 1; i <= l; i++) {
    lst.add(tileview(text: dat[i - 1], ic: Icons.ac_unit_outlined));
  }
  return lst;
}

class _CardviewState extends State<Cardview> {
  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = [tilehead(text: widget.head)];
    int len = (widget.ismore != "See More"
        ? widget.data.length
        : (widget.data.length > 2 ? 2 : widget.data.length));
    tiles = fetchtiles(tiles, len, widget.data);
    tiles.add(Container(
      color: chatPrimaryColor,
      height: 30,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.ismore,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              widget.icontype,
              size: 25,
              color: Colors.white,
            ),
          ],
        ),
        onTap: () => setState(() {
          if (widget.ismore == "See More") {
            widget.ismore = "See Less";
            widget.icontype = Icons.arrow_drop_up_outlined;
          } else {
            widget.ismore = "See More";
            widget.icontype = Icons.arrow_drop_down_outlined;
          }
        }),
      ),
    ));
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.white,
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(
          children: tiles,
        ),
      ),
    );
  }
}
