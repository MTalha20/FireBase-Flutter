import 'package:flutter/material.dart';


class Post extends StatelessWidget {

final Map data;
Post(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Image.network(data["url"],height: 100,width: 100,),
          Text(data["title"]),
          Text(data["description"]),
        ],
      ),      
    );
  }
}