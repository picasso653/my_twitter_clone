// ...
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../services/pick images/crop_image.dart';
import '../../../services/pick images/pick_image.dart';
import 'dart:io'; // Import the File class



class TweetComposer extends StatefulWidget {
  @override
  _TweetComposerState createState() => _TweetComposerState();
}


class _TweetComposerState extends State<TweetComposer> {
  final TextEditingController _tweetController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  XFile? _image; // Define _image at the class level

  Future<void> _postTweet() async {
    String tweetContent = _tweetController.text;
    if (tweetContent.isNotEmpty && _image != null) {
    String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
    String imagePath = 'images/$uniqueId.jpg';
    Reference ref = FirebaseStorage.instance.ref().child(imagePath);

    await ref.putFile(File(_image!.path));
    String imageUrl = await ref.getDownloadURL();

    await FirebaseFirestore.instance.collection('tweets').add({
      'content': tweetContent,
      'image_url': imageUrl, // Add the image URL to Firestore
      'timestamp': FieldValue.serverTimestamp(),
    });

    // Clear the tweet content and image after posting
    _tweetController.clear();
    setState(() {
      _image = null;
    });
  } else
  if (tweetContent.isNotEmpty) {
    await FirebaseFirestore.instance.collection('tweets').add({
      'content': tweetContent,
      'image_url': null,
      'timestamp': FieldValue.serverTimestamp(),
    });
    // Optionally, add the code to upload images here
    
  }
  Navigator.pop(context);
  }

  void _pickImage() async {
  XFile? image = await pickImage();
  setState(() {
    _image = image;
  });
}

   _cropImage() async {
  if (_image != null) {
    CroppedFile? croppedFile = await cropImage(_image!.path as File);
    if (croppedFile != null) {
      File cropped = File(croppedFile.path);
      setState(() {
        _image = XFile(cropped.path);
      });
    }
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose Tweet'),
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _postTweet,
          ),
          IconButton(
            icon: Icon(Icons.image),
            onPressed: _pickImage,
          ),
          IconButton(icon: Icon(Icons.crop), onPressed: _cropImage,)
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _tweetController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'What\'s happening?',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Add any additional UI elements you want for composing a tweet
        ],
      ),
    );
  }
}
