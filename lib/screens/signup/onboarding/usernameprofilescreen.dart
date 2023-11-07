import 'package:flutter/material.dart';
import 'package:my_twitter_clone/Widgets/textfield_widget.dart';

class UsernameProfileScreen extends StatelessWidget {
  final usernameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.pinkAccent,
                          backgroundImage: AssetImage(
                              'assets/images/default_profile_picture.jpeg'),
                        ),
                        Positioned(
                          bottom: -10,
                          left: 80,
                          child: IconButton(
                            onPressed: () {},
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
                    SizedBox(height: 15,),
                    MyTextField(
                      controller: firstNameController,
                      hintText: 'Enter your first name',
                      showHiddEye: false,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MyTextField(
                      controller: lastNameController,
                      hintText:
                          'Enter your last name and any other middle names',
                      showHiddEye: false,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MyTextField(
                      controller: usernameController,
                      hintText: 'Enter your new username',
                      showHiddEye: false,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the last onboarding screen
                      },
                      child: Text('Finish'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
