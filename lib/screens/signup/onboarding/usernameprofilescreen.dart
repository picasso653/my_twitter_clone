import 'dart:io';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_twitter_clone/Widgets/textfield_widget.dart';
import 'package:my_twitter_clone/services/pick%20images/pick_image.dart';

class UsernameProfileScreen extends StatefulWidget {
  const UsernameProfileScreen({
    super.key,
  });

  @override
  State<UsernameProfileScreen> createState() => _UsernameProfileScreenState();
}

class _UsernameProfileScreenState extends State<UsernameProfileScreen> {
  final usernameController = TextEditingController();

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final phoneNumberController = TextEditingController();

  XFile? profilepic;

  DateTime? selectedDate;

  final currentUserId = FirebaseAuth.instance.currentUser!.uid;

  void selectImage() async {
    profilepic = await pickImage();
    setState(() {});
  }

  void datePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> uploadProfilePicture() async {
    if (profilepic != null) {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('profile_pictures')
          .child('${currentUserId}.jpg');

      await ref.putFile(File(profilepic!.path));

      String imageUrl = await ref.getDownloadURL();

      // Update 'profilePictureUrl' field in Firestore
      FirebaseFirestore.instance.collection('Users').doc(currentUserId).update({
        'profilepicture': imageUrl,
      });
    }
  }

  void updateProfile() {
    showDialog(
      context: context,
      builder: (context) => Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    // Update user data in Firestore
    FirebaseFirestore.instance.collection('Users').doc(currentUserId).update({
      'username': usernameController.text,
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'phone': phoneNumberController.text,
      'DoB': selectedDate,
    });

    // If a new profile picture was selected, upload it and update the URL in Firestore
    if (profilepic != null) {
      // Upload profile picture and get URL
      uploadProfilePicture();
    }
    usernameController.clear();
    firstNameController.clear();
    lastNameController.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFDDA0DD),
                  Colors.purpleAccent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Stack(
                    children: [
                      profilepic != null
                          ? CircleAvatar(
                              radius: 64,
                              backgroundColor: Colors.pinkAccent,
                              backgroundImage: FileImage(
                                File(profilepic!.path),
                              ))
                          : CircleAvatar(
                              radius: 64,
                              backgroundColor: Colors.pinkAccent,
                              backgroundImage: AssetImage(
                                  'assets/images/default_profile_picture.jpeg'),
                            ),
                      Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          onPressed: selectImage,
                          icon: Icon(
                            Icons.add_a_photo_rounded,
                            color: Colors.white60,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Text(
                    'Personalize Your Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    controller: firstNameController,
                    hintText: 'Enter your first name',
                    showHiddEye: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    controller: lastNameController,
                    hintText: 'Enter your last name and any other middle names',
                    showHiddEye: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Enter your new username',
                    showHiddEye: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: datePicker,
                        child: Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.calendar_month,
                              ),
                            ),
                            Text(
                              selectedDate != null
                                  ? 'Date of Birth: ${DateFormat('dd/MM/yyyy').format(selectedDate!)}'
                                  : 'Select Date of Birth',
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          updateProfile();
                        },
                        child: Text('Finish'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
