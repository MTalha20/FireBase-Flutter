import 'package:firebase_app/SignUp.dart';
import 'package:firebase_app/Login.dart';
import 'package:firebase_app/home.dart';
import 'package:firebase_app/post.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      routes: {
        "/signup": (context) => SignUp(),
        "/login": (context) => Login(), 
        "/post": (context) => Post(),
        "/home": (context) => Home(), 
      },
    );
  }
}