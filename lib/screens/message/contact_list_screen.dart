import 'package:flutter/material.dart';
import 'package:my_twitter_clone/screens/message/chat_screen.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacts',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purpleAccent, // Use purple accent color
              radius: 24,
            ),
            title: Text('John Doe'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen(contactName: 'John Doe')),
              );
            },
          ),
          // Add more contacts as needed...
        ],
      ),
    );
  }
}
