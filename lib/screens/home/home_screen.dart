import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Create tweet/tweet_composer.dart';



class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

  void _openTweetComposer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TweetComposer()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
      ),

      body: StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection('tweets').snapshots(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return CircularProgressIndicator(); // Loading indicator
    }
    final tweets = snapshot.data!.docs;
    return ListView.builder(
      itemCount: tweets.length,
      itemBuilder: (context, index) {
        var tweetContent = tweets[index].get('content');
        var imageUrl = tweets[index].get('image_url');
        var profilepicture = tweets[index].get('profilePictureUrl');
        var username = tweets[index].get('username');
        var timestamp = tweets[index].get('timestamp');

        return ListTile(
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // User Profile Picture
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(profilepicture),
          ),
          SizedBox(width: 8), // Add spacing between profile picture and content

          // Username and Date
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                ' ${DateFormat('MMM dd, yyyy').format(timestamp.toDate())}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Spacer(), // Add space between username and like button

          // Like Button
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              
            },
          ),
        ],
      ),
      SizedBox(height: 8), // Add spacing between user info and tweet content

      // Tweet Content
      Text(tweetContent),
      if (imageUrl != null)
        Image.network(imageUrl),
    ],
  ),
);

      },
    );
  },
)
,

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openTweetComposer(context);
        },
        backgroundColor: Colors.pinkAccent,
        child: Icon(Icons.edit),
      ),
    );
  }
}
