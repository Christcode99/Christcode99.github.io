import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:simplon/pages/listpage.dart';
import 'package:simplon/pages/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyCVpYuFz6vYXlLIzpG4RhAnJ-rx7JXPwqg",
    appId: "1:127868222423:web:6e1adfd57c272ad704e992",
    messagingSenderId: "127868222423",
    projectId: "simplon-2b2c7",
  ));
  runApp(homepage());
}

class homepage extends StatelessWidget {
  homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        title: 'Simplon register',
        home: const SignUp());
  }
}
