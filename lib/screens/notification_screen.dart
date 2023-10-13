import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Use blue color for app bar
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Notification Item 1
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purpleAccent, // Use purple accent color
                radius: 24,
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
              title: Text('John Doe liked your tweet'),
            ),
            // Notification Item 2
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.greenAccent, // Use green accent color
                radius: 24,
                child: Icon(
                  Icons.repeat,
                  color: Colors.white,
                ),
              ),
              title: Text('Jane Doe retweeted your tweet'),
            ),
            // Add more notification items as needed...
          ],
        ),
      ),
    );
  }
}
