import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Colors.blue,
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset(
                  'assets/images/icon-480.png',
                  height: 50,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person_outline),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 18, // Increased font size
                    color: Colors.white, // Changed text color
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.list_alt_outlined),
                title: Text(
                  'List',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onTap: signUserOut,
              ),
            ],
          ),
        ),
      ) ;
  }
}