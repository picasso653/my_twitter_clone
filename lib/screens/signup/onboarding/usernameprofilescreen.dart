import 'package:flutter/material.dart';

class UsernameProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            // Allow the user to enter their preferred username
          ),
          ElevatedButton(
            onPressed: () {
              // Allow the user to choose a profile picture
            },
            child: Text('Select Profile Picture'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the last onboarding screen
            },
            child: Text('Finish'),
          ),
        ],
      ),
    );
  }
}
