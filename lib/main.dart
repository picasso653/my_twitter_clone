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
            primaryColor: const Color(0xFFFE029A),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Color(0xFFE0E0E0)),
            ),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color(0xFF79F6CB))),
        home: LoginScreen());
  }
}
