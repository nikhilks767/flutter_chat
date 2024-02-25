// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bottom_nav/dummy_db.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int indexval = 2;

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        title: Text(
          DummyDb.dataDb[widget.index]["user_name"],
          style:
              TextStyle(color: Colors.blue[700], fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          Container(
            width: 25,
            height: 25,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey[100]),
            child: Icon(
              Icons.call_outlined,
              color: Colors.black,
              size: 17,
            ),
          ),
          SizedBox(width: 18),
          Container(
            width: 25,
            height: 25,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey[100]),
            child: Icon(
              Icons.videocam_outlined,
              color: Colors.black,
              size: 17,
            ),
          ),
          SizedBox(width: 35),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: DummyDb.dataDb.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: index % 2 == 0
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(11),
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: index % 2 == 0
                              ? Colors.grey[100]
                              : Colors.blue[600]),
                      child: Text(
                        DummyDb.dataDb[index]["message"],
                        style: TextStyle(
                          color: index % 2 == 0 ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    width: screenwidth * 0.75,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[100],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: TextFormField(
                        showCursor: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.emoji_emotions_outlined,
                              color: Colors.grey,
                            ),
                            suffixIcon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.grey,
                            ),
                            hintText: "Write here",
                            hintStyle: TextStyle(height: 3.5)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: FloatingActionButton(
                    backgroundColor: Colors.blue[600],
                    onPressed: () {},
                    child: Icon(Icons.send),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (value) {
            setState(() {
              indexval = value;
            });
          },
          indicatorShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.white,
          height: 70,
          elevation: 0,
          selectedIndex: indexval,
          indicatorColor: Colors.blue[600],
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: "",
            ),
            NavigationDestination(
              icon: Icon(Icons.access_time),
              label: "",
            ),
            NavigationDestination(
              icon: Icon(Icons.messenger_outline_sharp),
              label: "",
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              label: "",
            ),
          ]),
    );
  }
}
