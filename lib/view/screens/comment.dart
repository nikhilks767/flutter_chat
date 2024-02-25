// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bottom_nav/view/screens/widgets/comment_first.dart';
import 'package:bottom_nav/view/screens/widgets/comment_second.dart';
import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios_sharp,
          color: Colors.black,
        ),
        title: Text(
          "Message",
          style:
              TextStyle(color: Colors.blue[700], fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CommentFirst(),
          CommentSecond(),
        ],
      ),
    );
  }
}
