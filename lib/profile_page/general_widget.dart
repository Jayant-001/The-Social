import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

//___________________________Card_View____________________________________________________

Widget CardView({required String head, required List data}) {
  return Card(
    elevation: 5,
    shadowColor: Colors.black,
    color: Colors.white,
    child: Column(
      children: [
        Container(
          height: 24,
          alignment: Alignment.topLeft,
          child: tilehead(text: head),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 40 * data.length.toDouble(),
          child: ListView.separated(
            padding: EdgeInsets.all(0),
            separatorBuilder: (context, index) =>
                Divider(height: 0, color: Colors.white),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return tileview(text: data[index], ic: Icons.ac_unit_outlined);
            },
          ),
        )
      ],
    ),
  );
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

//___________________________Function for editing image_________________________

