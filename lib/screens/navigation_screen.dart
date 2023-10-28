import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_twitter_clone/screens/home/home_screen.dart';
import 'package:my_twitter_clone/screens/notification_screen.dart';
import 'package:my_twitter_clone/screens/search_screen.dart';
import 'package:my_twitter_clone/screens/home/Drawer.dart';

import 'message/messages_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: PageView(
        controller: _pageController,
        children: [
          HomeScreen(),
          SearchScreen(),
          NotificationScreen(),
          MessagesScreen(),
        ],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: GNav(
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
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
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

