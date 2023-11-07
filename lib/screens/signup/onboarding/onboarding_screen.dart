import 'package:flutter/material.dart';
import 'package:my_twitter_clone/screens/signup/onboarding/usernameprofilescreen.dart';
import 'package:my_twitter_clone/screens/signup/onboarding/welcome_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'last_onboarding_screen.dart';

class MainOnboardingScreen extends StatefulWidget {
  @override
  State<MainOnboardingScreen> createState() => _MainOnboardingScreenState();
}

class _MainOnboardingScreenState extends State<MainOnboardingScreen> {
  PageController _pageController = PageController();

  bool onLastPageIndicator = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              onLastPageIndicator = (index == 2);
            });
          },
          children: [
            WelcomeScreen(),
            UsernameProfileScreen(),
            LastOnboardingScreen(),
          ],
        ),
        onLastPageIndicator
            ? Container()
            : Container(
                alignment: Alignment(0.85, -0.90),
                child: TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(2);
                  },
                  child: Text('skip'),
                ),
              ),
        Container(
          alignment: Alignment(0, 0.85),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOutCubic,
                  );
                },
                child: Text('prev'),
              ),
              SmoothPageIndicator(controller: _pageController, count: 3),
              onLastPageIndicator
                  ? TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'homescreen');
                      },
                      child: Text('done'),
                    )
                  : TextButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOutCubic,
                        );
                      },
                      child: Text('next'),
                    ),
            ],
          ),
        )
      ]),
    );
  }
}
