import 'package:flutter/material.dart';

class LastOnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Onboarding Complete!'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to either Home or Profile screen
                  },
                  child: Text('let\'s finish creating your profile?'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
