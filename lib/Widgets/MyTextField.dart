import 'package:flutter/material.dart';

class MyTexField extends StatelessWidget {
  final controller;
  final String hint;
  final bool obscure;

  const MyTexField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.obscure});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12)),
            fillColor:  const Color.fromARGB(255, 236, 188, 45),
            filled: true,
            hintText: hint),
      ),
    );
  }
}
