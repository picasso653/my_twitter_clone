import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_twitter_clone/Widgets/MyTextField.dart';
import 'package:my_twitter_clone/Widgets/my_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  
  BuildContext? get context => null;
  
  // for the Login
  void logIn() async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );
      // ignore: unnecessary_null_comparison
      if (user != null) {
        Navigator.pushNamed(context!, '/home');
      }
    } catch (e) {
      print(e);
    }
  }

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
           Text(
            'Welcome Back Fam!',
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color:  Theme.of(context).colorScheme.secondary,),
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
          MyButton(onTap: logIn),
          const SizedBox(height: 15,),

          // Don't have an account? Sign Up
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account? Sign Up'),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
