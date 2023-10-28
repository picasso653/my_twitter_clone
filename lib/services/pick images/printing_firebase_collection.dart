import 'package:cloud_firestore/cloud_firestore.dart';

void printFirestoreData() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference tweetsCollection = firestore.collection('tweets');

  QuerySnapshot querySnapshot = await tweetsCollection.get();

  querySnapshot.docs.forEach((DocumentSnapshot document) {
    String content = document['content'];
    String imageUrl = document['image_url'];

    // Print the data
    print('Content: $content');
    print('Image URL: $imageUrl');
  });
}
