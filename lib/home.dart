import 'package:firebase_app/post.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  final Stream<QuerySnapshot> PostStream = FirebaseFirestore.instance.collection('posts').snapshots();
  @override
  
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
      stream: PostStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
    
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
    
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map <String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Post(data);
          }).toList(),
        );
      },
      )
        ),
      
    );
  }
}



