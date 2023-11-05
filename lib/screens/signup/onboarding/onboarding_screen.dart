import 'package:flutter/material.dart';
import 'package:my_twitter_clone/screens/signup/onboarding/usernameprofilescreen.dart';
import 'package:my_twitter_clone/screens/signup/onboarding/welcome_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'last_onboarding_screen.dart';



class MainOnboardingScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [PageView(
        controller: _pageController,
        children: [
          WelcomeScreen(),
          UsernameProfileScreen(),
          LastOnboardingScreen(),
        ],
      ),
      Container(
        alignment: Alignment(0, 0.75),
        child: SmoothPageIndicator(controller: _pageController, count: 3),
      )
      ]
    );
  }
}