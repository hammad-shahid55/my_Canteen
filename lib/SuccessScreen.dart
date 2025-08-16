import 'package:canteen_final/SignInScreen.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image with white checkmark overlay
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background image (Vector.png)
                      Image.asset(
                        'assets/Vector.png',
                        height: 120,
                        width: 120,
                        color: Colors.green,
                      ),
                      // White checkmark
                      Icon(
                        Icons.check,
                        size: 60,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Title Text
                  const Text(
                    "You're All Set!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Subtitle Text
                  const Text(
                    "Your password has been successfully changed.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Urbanist',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text(
                    'Go to Homepage',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Native Home Indicator
            Container(
              width: 100,
              height: 5,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
