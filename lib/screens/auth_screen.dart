import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_twitter_clone/screens/login_screen.dart';
import 'home_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          print(snapshot.data);
          // Is user logged in
          if (snapshot.hasData) {
            return  HomeScreen();
          }
          else {
            return  LoginScreen();
          }
          // Is user not logged in
        }),
      );
  }
}
