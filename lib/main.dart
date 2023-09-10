import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_twitter_clone/screens/login_screen.dart';

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
        title: 'Twitter Clone',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFE029A)),
            buttonTheme: const ButtonThemeData(
           buttonColor: Color.fromARGB(255, 137, 255, 82),
           shape: RoundedRectangleBorder()),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.blueAccent),
            ),
            
            ),
        home: LoginScreen());
  }
}
