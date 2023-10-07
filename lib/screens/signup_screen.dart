import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Widgets/square_tile.dart';
import '../Widgets/textfield_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  // Text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void SignUserUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text, password: passwordController.text);
    } 
  }

  bool passwordConfirmed() =>
      passwordController.text == confirmPasswordController.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              // The Y logo
              Image.asset(
                'assets/images/icon-480.png',
                height: 50,
              ),
              const SizedBox(
                height: 25,
              ),
              // 'Wanna login?' Text
              Text(
                'Become A Member!',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              // Username text field
              //Email box
              MyTextField(
                  controller: usernameController,
                  hintText: 'Type in your email',
                  showHiddEye: false),
              const SizedBox(
                height: 10,
              ),

              // password box
              MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  showHiddEye: true),
              const SizedBox(
                height: 10,
              ),
              // Retype password box
              MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm password',
                  showHiddEye: true),
              const SizedBox(
                height: 10,
              ),
              // Login button
              ElevatedButton(
                onPressed: SignUserUp,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green, // Change text color
                  minimumSize:
                      Size(double.infinity, 50), // Change button height
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18), // Change text size
                ),
              ),

              // Sign Up using other methods
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.purpleAccent,
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Sign up with',
                      style: TextStyle(color: Colors.greenAccent),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.purpleAccent,
                  ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagepath: 'assets/images/google_logo.png'),
                  const SizedBox(
                    width: 25,
                  ),
                  SquareTile(imagepath: 'assets/images/google_logo.png')
                ],
              ),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Already a member?'),
                const SizedBox(
                  width: 5,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'loginScreen');
                    },
                    child: Text(
                      'Log In!',
                      style: TextStyle(color: Colors.blueAccent),
                    ))
              ])
            ],
          ),
        ),
      )),
    );
  }
}
