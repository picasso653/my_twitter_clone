import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_twitter_clone/services/auth_services.dart';

import '../Widgets/square_tile.dart';
import '../Widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  //Log User In method
  void logUserIn() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) => Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
// Main lgoin function
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: usernameController.text,
      password: passwordController.text,
    );
    // Pop Goes the weasel... or  however they spell it
    Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found'){
        return wrongEmailMessage();
      } else if (e.code == 'wrong-password'){
        return wrongPasswordMessage();
      }
    }

  }


void wrongEmailMessage(){
   showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text('Wrong Email'),
    );
  });
}

void wrongPasswordMessage(){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text('Wrong Password'),
    );
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                // The Y logo
                Image.asset(
                  'assets/images/icon-480.png',
                  height: 50,
                ),
                const SizedBox(
                  height: 25,
                ),
                // 'Wecome Back' Text
                Text('Welcome Back!',
                    style: TextStyle(
                      fontSize: 24, // Increased font size
                      color: Colors.indigo, // Changed text color
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 10,
                ),
                // 'Wanna login?' Text
                Text(
                  'Wanna Login?',
                  style: TextStyle(
                    fontSize: 18, // Increased font size
                    color: Colors.deepPurpleAccent, // Changed text color
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Username/email box
                MyTextField(
                  controller: usernameController,
                  hintText: 'Type in your email',
                  showHiddEye: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                // password box
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  showHiddEye: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                // Login button
                ElevatedButton(
                  onPressed: logUserIn,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.indigo, // Change text color
                    minimumSize:
                        Size(double.infinity, 50), // Change button height
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 18), // Change text size
                  ),
                ),
                // "Forgot password?" Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey, // Changed text color
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                // Login with google
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.purpleAccent,
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Log in with',
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.purpleAccent,
                    ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                    imagepath: 'assets/images/google_logo.png',
                    onTap: () {
                       AuthService().signInWithGoogle();
                    },
                  ),
                  const SizedBox(width: 50,),
                    SquareTile(
                    imagepath: 'assets/images/google_logo.png',
                    onTap: () {
                      AuthService().signInWithGoogle();
                    },
                  ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // "Don't have an account? Login" Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'signupScreen');
                        },
                        child: Text(
                          'Sign up!',
                          style: TextStyle(color: Colors.blueAccent),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
