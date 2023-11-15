import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LastOnboardingScreen extends StatelessWidget {
  final Function goToLastPage;

  const LastOnboardingScreen({super.key, required this.goToLastPage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 185, 150, 247),
      body: Container(
        
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(
                'assets/images/onboarding_screen_image-9.jpeg',
                fit: BoxFit.cover,
                height: 350,
                width: MediaQuery.of(context).size.width,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x090979), // Use a deeper purple color
                        Colors.purpleAccent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        'Connect with different kinds of people\n\nacross the globe through tweets.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          goToLastPage();
                        },
                        child: Text('Let\'s update your profile!'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
