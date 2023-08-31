import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Login Icon
        const SizedBox(height: 50,),
        Icon(Icons.adjust,size: 30,color: Colors.amber[400],),

        // Welcome back 
        const Text('Welcome Back Fam!'),

        //Textfield for email
        const TextField(
          obscureText: false,
          decoration: InputDecoration(
            hintText: "Email"
          ),
        )

        //Textfield for password


        // Log In button

        // Don't have an account? Sign Up
      ],
    ));
  }
}