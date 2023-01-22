import 'dart:html';
import 'dart:js';

import 'package:simplon/animation/FadeAnimation.dart';
import 'package:simplon/helper/firebasehelper.dart';
import 'package:flutter/material.dart';
import 'package:simplon/pages/listpage.dart';
// ignore: unused_import
import 'package:simplon/helper/usermodel.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_storage/firebase_storage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
        body: Card(
      margin: EdgeInsets.all(8),
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      child: Text(
                        "Simplon.CI",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 200,
                      width: 500,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                        "assets/images/welcome.png",
                      ))),
                    ),
                    Container(
                      height: 200,
                      child: Stack(
                        children: <Widget>[
                          // Container(
                          //   child: Positioned(
                          //     left: 30,
                          //     width: 80,
                          //     height: 200,
                          //     // child: FadeAnimation(
                          //     //     1,
                          //     //     Container(
                          //     //         // decoration: const BoxDecoration(
                          //     //         //     image: DecorationImage(
                          //     //         //         image: AssetImage(
                          //     //         //             'assets/images/light-1.png'))),
                          //     //         )),
                          //   ),
                          // ),
                          // Positioned(
                          //   left: 140,
                          //   width: 80,
                          //   height: 150,
                          //   child: FadeAnimation(
                          //       1.2,
                          //       Container(
                          //           // decoration: const BoxDecoration(
                          //           //     image: DecorationImage(
                          //           //         image: AssetImage(
                          //           //             'assets/images/light-2.png'))),
                          //           )),
                          // ),
                          // const SizedBox(
                          //   height: 50,
                          // ),
                          // Positioned(
                          //   right: 40,
                          //   top: 40,
                          //   width: 80,
                          //   height: 150,
                          //   child: FadeAnimation(
                          //       1.5,
                          //       Container(
                          //         decoration: const BoxDecoration(
                          //             image: DecorationImage(
                          //                 image:
                          //                     AssetImage('assets/images/clock.png'))),
                          //       )),
                          // ),
                          Positioned(
                            child: FadeAnimation(
                                1.6,
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: const Center(
                                    child: Text(
                                      "Enregistrer vos informations  ",
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                        1.8,
                        Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: (brightness == Brightness.light)
                                  ? Colors.white
                                  : Colors.grey[700],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    //color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 40,
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Nom",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                height: 40,
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: firstnameController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Prenom(s)",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                height: 40,
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: numberController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: " Numéro de téléphone",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                height: 40,
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //  FadeAnimation(
                      //     2,
                      //     InkWell(
                      //       onTap: test ()

                      //       // var route = MaterialPageRoute(
                      //       //     builder: (BuildContext context) => ContactController());
                      //       // Navigator.of(context).push(route);
                      //     ,
                      // child: Container(
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       gradient: const LinearGradient(colors: [
                      //         Color.fromRGBO(143, 148, 251, 1),
                      //         Color.fromRGBO(143, 148, 251, .6),
                      //       ])),
                      //     child: const Center(
                      //       //tranformer ce login1 en bouton
                      //       child: Text(
                      //         "Create Account",
                      //         style: TextStyle(
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //   ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                        2.5,
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent,
                                // ignore: prefer_const_constructors
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                // ignore: prefer_const_constructors
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            child: const Text("Rejoindre la liste"),
                            onPressed: () {
                              _navigateToNextScreen(BuildContext context) {
                                Navigator.of(this.context).push(MaterialPageRoute(
                                    builder: (context) => ContactController()));
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

test() {
  var emailController;
  if (emailController.text != " ") {
    var passwordController;
    if (passwordController.text != "") {
      var email;
      FirebaseHelper()
          .handleSignIn(email.text, passwordController.text)
          .then((user) {
        _navigateToNextScreen(BuildContext context) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ContactController()));
     } });
    } else {
      print("password vide");
    }
  } else {
    print("email vide ");
  }
}
