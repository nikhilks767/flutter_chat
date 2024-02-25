// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../screens/comment.dart';
import '../screens/home.dart';
import '../screens/profile.dart';
import '../screens/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexVal = 0;
  List screens = [
    Home(),
    Search(),
    Comment(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexVal],
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (value) {
            setState(() {
              indexVal = value;
            });
          },
          selectedIndex: indexVal,
          indicatorShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.white,
          height: 70,
          elevation: 0,
          indicatorColor: Colors.blue[700],
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
              ),
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
