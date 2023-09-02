import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Login Icon
          const SizedBox(height: 20,),
          Icon(Icons.adjust,size: 30,color: Colors.amber[400],),
          const SizedBox(height: 50,),
    
          // Welcome back 
          const Text('Welcome Back Fam!'),
          const SizedBox(height: 60,),
    
          //Textfield for email
          
    
          //Textfield for password
    
    
          // Log In button
    
          // Don't have an account? Sign Up
        ],
      ),
    ));
  }
}