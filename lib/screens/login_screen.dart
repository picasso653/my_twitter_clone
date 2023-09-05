import 'package:flutter/material.dart';
import 'package:my_twitter_clone/Widgets/MyTextField.dart';
import 'package:my_twitter_clone/Widgets/my_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  // for the Login
  void logIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Login Icon
          const SizedBox(
            height: 50,
          ),
          const Icon(
            Icons.adjust,
            size: 100,
            color: Color.fromARGB(255, 236, 188, 45),
          ),
          const SizedBox(
            height: 50,
          ),

          // Welcome back
          const Text(
            'Welcome Back Fam!',
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color:  Color.fromARGB(255, 236, 188, 45),),
          ),
          const SizedBox(
            height: 60,
          ),

          //Textfield for email
          MyTexField(
              hint: "Email", obscure: false, controller: usernameController),
          const SizedBox(
            height: 20,
          ),
          //Textfield for password
          MyTexField(
              controller: passwordController, hint: "Password", obscure: true),
          const SizedBox(
            height: 20,
          ),
          // Forgot Password?
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Forgot Password ?'),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Log In button
          MyButton(onTap: logIn)

          // Don't have an account? Sign Up
        ],
      ),
    ));
  }
}
