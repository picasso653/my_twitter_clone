import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_twitter_clone/screens/login_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginScreen());
}
