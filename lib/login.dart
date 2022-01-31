import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {

    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();

    void login()async{
      final String name = "";
      final String email = emailcontroller.text;
      final String password = passwordcontroller.text;
      final FirebaseAuth auth = FirebaseAuth.instance;
      final FirebaseFirestore db = FirebaseFirestore.instance;
        try {
        
        final UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, 
          password: password);
        final  DocumentSnapshot snapshot = await db.collection("Credentials").doc(auth.currentUser?.uid).get();
        final data = snapshot.data();
        print(data["user_Id"]);
        print("LoggedIn");
        print(data);
        
      } catch (e) {
          print("Error");
      }
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/login-logo.png",height: 200, width: 200,),
                TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(labelText: "Enter Email"),),
                TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(labelText: "Enter Password"),),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: login, child: const Text("Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}