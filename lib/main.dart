import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_twitter_clone/screens/auth_screen.dart';
import 'package:my_twitter_clone/screens/home_screen.dart';
import 'package:my_twitter_clone/screens/login_screen.dart';
import 'package:my_twitter_clone/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
      routes:{
        'signupScreen': (context) => SignUpScreen(),
        'loginScreen': (context) => LoginScreen(),
        'homescreen': (context) => HomeScreen(),
        
      },
    );
  }
}