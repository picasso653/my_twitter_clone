import 'package:flutter/material.dart';

class MyTexField extends StatelessWidget {
  const MyTexField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
            obscureText: false,
            decoration: InputDecoration(
              hintText: "Email"
            ),
          );
  }
}