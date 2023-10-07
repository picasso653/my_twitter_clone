import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final controller;
  final String hintText;

  final bool showHiddEye;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.showHiddEye});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool obscureTextValue = true;

  void toggleObscureText() {
    setState(() {
      obscureTextValue = !obscureTextValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.showHiddEye?obscureTextValue: false,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.pinkAccent),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintText,
          suffixIcon: widget.showHiddEye
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye_outlined),
                  color: Colors.grey[300],
                  onPressed: toggleObscureText,
                )
              : null,
              ),
    );
  }
}
