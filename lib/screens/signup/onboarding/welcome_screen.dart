import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 247, 240, 214), // Use a shade of purple
      body: Column(
        children: [
          Image.asset(
            'assets/images/welcome.png',
            fit: BoxFit.cover,
            height: 350,
            width: MediaQuery.of(context).size.width,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                 gradient: LinearGradient(
                  colors: [Color(0xFFDDA0DD), Colors.purpleAccent],
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
                    height: 30,
                  ),
                  Text(
                    "Welcome to Y!🎉🎊",
                    style: GoogleFonts.permanentMarker(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  Text(
                    'Embark on an exciting journey with us! 🚀 \n\n Welcome to Y, a twitter clone where you\n\n can connect, share, and explore in style.',
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Let\'s get you all set up! 💫 ",
                        style: GoogleFonts.allertaStencil(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_forward_rounded, color: Colors.white)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
