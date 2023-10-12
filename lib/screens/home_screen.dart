import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_twitter_clone/screens/Drawer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text(
          "LOGGED IN AS : " + user.email!,
          style: TextStyle(
            fontSize: 24, 
            color: Colors.black, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar:  GNav(
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon: LineIcons.bell,
                    text: 'Notifications',
                  ),
                  GButton(
                    icon: LineIcons.envelope,
                    text: 'Messages',
                  ),
                ],
                selectedIndex: 0,
                onTabChange: (index) {},
                rippleColor: Colors.grey,
                hoverColor: Colors.grey,
                gap: 5,
                activeColor: Colors.pink,
                iconSize: 20,
                textStyle: TextStyle(fontSize: 12, color: Colors.black),
              ),
          
    );
  }
}
