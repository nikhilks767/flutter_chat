// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:bottom_nav/dummy_db.dart';
import 'package:flutter/material.dart';

class CommentFirst extends StatelessWidget {
  const CommentFirst({super.key});

  @override
  Widget build(BuildContext context) {
    List shuffledPic = List.from(DummyDb.dataDb)..shuffle(Random());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Icon(Icons.search),
                  //         // SizedBox(
                  //         //   width: 15,
                  //         // ),
                  //         Expanded(
                  //           child: TextField(
                  //               decoration: InputDecoration(
                  //                   hintText: "Search a doctor")),
                  //         ),
                  //       ],
                  //     ),
                  //     Icon(Icons.mic_none),
                  //   ],
                  // ),
                  child: TextFormField(
                    showCursor: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        suffixIcon: Icon(
                          Icons.mic_none,
                          color: Colors.grey,
                        ),
                        hintText: "Search a doctor",
                        hintStyle: TextStyle(height: 3.3)),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Active Now",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
            height: 90,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: DummyDb.dataDb.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Stack(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage(shuffledPic[index]["prof_pic"]),
                  ),
                  Positioned(
                    top: 2,
                    right: 2,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.greenAccent[400],
                    ),
                  )
                ],
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: 25,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Messages",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
