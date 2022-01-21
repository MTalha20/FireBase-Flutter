import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {

    final TextEditingController usernamecontroller = TextEditingController();
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();

    void SIGNUP()async{
      FirebaseAuth auth = FirebaseAuth.instance;
      final String username = usernamecontroller.text;
      final String email = emailcontroller.text;
      final String password = passwordcontroller.text;
      try {
        await auth.createUserWithEmailAndPassword(email: email, password: password);
        print("Added");
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
                  controller: usernamecontroller,
                  decoration: InputDecoration(labelText: "Enter UserName"),),
                TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(labelText: "Enter Email"),),
                TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(labelText: "Enter Password"),),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: SIGNUP, child: const Text("SignUp"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}