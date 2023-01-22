import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:simplon/models/chatcontroller.dart';

import 'package:simplon/helper/firebasehelper.dart';

import '../helper/usermodel.dart';



class ContactController extends StatefulWidget {
  const ContactController({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ContactControllerState createState() => _ContactControllerState();
}

class _ContactControllerState extends State<ContactController> {
  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      query: FirebaseHelper.userEntry,
      sort: (a, b) => (a
          .child('prenoms')
          .value
          .toString()
          .toLowerCase()
          .compareTo(b.child('prenoms').value.toString().toLowerCase())),
      itemBuilder: (BuildContext ctx, DataSnapshot snap,
          Animation<double> animation, int index) {
        MyUser newUser = MyUser(snap);
        if (FirebaseHelper().auth.currentUser!.uid == newUser.uid) {
          return Container(
              // child: Center(child: Text("Aucun utilisateur")),
              );
        } else {
          return Column(
            children: [
              ListTile(
                title: Text(newUser.nom),
                subtitle: Text("Ecrivez Moi ..."),
                // trailing: IconButton(
                //   // onPressed: () {
                //   //   Navigator.push(
                //   //     context,
                //   //     MaterialPageRoute(builder: (context) {
                //   //       return ChatController(partenaire: newUser);
                //   //     }),
                //   //   );
                //   // },
                //   icon: Icon(CupertinoIcons.bubble_left_bubble_right_fill
                //       // Icons.message
                //       ),
                // ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: Colors.grey,
                ),
              )
            ],
          );
        }
      },
    );
  }
}
