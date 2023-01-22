
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simplon/helper/usermodel.dart';


class FirebaseHelper {
  final auth = FirebaseAuth.instance;

  //Authentification d'un user
  Future<User?> handleSignIn(String mail, String mdp) async {
    final User? user =
        (await auth.signInWithEmailAndPassword(email: mail, password: mdp))
            .user;
    return user;
  }

  Future<bool> handleLogOut() async {
    await auth.signOut();
    return true;
  }

  //creation  d'un user
  Future<User> create(
      String mail, String mdp, String prenoms, String nom) async {
    final create =
        await auth.createUserWithEmailAndPassword(email: mail, password: mdp);
    final User? user = create.user;
    String uid = user!.uid;
    Map<String, String> map = {"prenoms": prenoms, "nom": nom, "uid": uid, };
    addUser(uid, map);
    return user;
  }

  // database

  // le point d'entré de la bd
  static final entryPoint = FirebaseDatabase.instance.ref();
  // le point d'entré de l'entité user
  static final userEntry = entryPoint.child("users");
  //ajouter un user
  addUser(String uid, Map map) {
    userEntry.child(uid).set(map);
  }

  // obtenir user
  Future<MyUser> getUser(String uid) async {
    DatabaseEvent snapshot = (await userEntry.child(uid).once());
    MyUser user = MyUser(snapshot.snapshot);
    return user;
  }

  }


