// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bottom_nav/dummy_db.dart';
import 'package:bottom_nav/view/screens/widgets/chat_page.dart';
import 'package:flutter/material.dart';

class CommentSecond extends StatelessWidget {
  const CommentSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView.separated(
        itemCount: DummyDb.dataDb.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[300],
            backgroundImage: AssetImage(DummyDb.dataDb[index]["prof_pic"]),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(DummyDb.dataDb[index]["user_name"],
              style: TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text(
            DummyDb.dataDb[index]["message"],
            style: TextStyle(
                color: DummyDb.dataDb[index]["count"] > 0
                    ? Colors.blue[700]
                    : Colors.black.withOpacity(0.7)),
          ),
          subtitleTextStyle: TextStyle(fontSize: 13),
          tileColor: Colors.grey[100],
          trailing:
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              DummyDb.dataDb[index]["time"],
              style: TextStyle(fontSize: 13),
            ),
            SizedBox(
              height: 15,
            ),
            DummyDb.dataDb[index]["count"] > 0
                ? Visibility(
                    child: CircleAvatar(
                      radius: 9,
                      backgroundColor: Colors.blue[700],
                      child: Text(
                        DummyDb.dataDb[index]["count"].toString(),
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                : SizedBox(),
          ]),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    index: index,
                  ),
                ));
          },
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
