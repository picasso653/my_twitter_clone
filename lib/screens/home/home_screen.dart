import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Create tweet/tweet_composer.dart';



class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

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

        return ListTile(
          title: Column(
        children: [
          Text(tweetContent),
          if (imageUrl != null)
            Image.network(imageUrl),
        ],
      ) // Add other UI elements for tweets as needed
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
