import 'package:canteen_final/EmailAuthScreen.dart';
import 'package:canteen_final/SignInScreen.dart';
import 'package:canteen_final/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:canteen_final/PhoneSignInScreen.dart'; // Import the new phone sign-in screen

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 22),
                      Center(
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Opacity(
                            opacity: 1.0,
                            child: Image.asset('assets/chef.png',
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                      const Text(
                        "Let’s Get Started!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Urbanist',
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Let’s dive into your account",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Urbanist',
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildButton(
                        context,
                        icon: Icons.phone,
                        text: "Continue with Phone",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhoneSignInScreen(),
                            ),
                          );
                        },
                      ),
                      _buildGoogleButton(context),
                      _buildButton(
                        context,
                        icon: Icons.apple,
                        text: "Continue with Apple",
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Apple Sign-In is disabled.")),
                          );
                        },
                      ),
                      _buildButton(
                        context,
                        icon: Icons.email,
                        text: "Continue with Email",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmailAuthScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.green, // Set green background color
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      _buildSignInButton(context),
                      const SizedBox(height: 28),
                      const Text(
                        "Privacy Policy   .   Terms of Service",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black54,
                          fontFamily: 'Urbanist',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 375,
                    height: 34,
                    padding: const EdgeInsets.fromLTRB(114, 21, 113, 8),
                    child: Opacity(
                      opacity: 0.8,
                      child: Container(
                        height: 5,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Button for Continue with Phone, Google, Apple, Email
  Widget _buildButton(BuildContext context,
      {required IconData icon,
      required String text,
      required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          side: const BorderSide(
            color: Color(0xFFE2DFDF),
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          minimumSize: const Size.fromHeight(50),
        ),
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        label: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  // Google Sign-In Button (functionality removed)
  Widget _buildGoogleButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          side: const BorderSide(
            color: Color(0xFFE2DFDF),
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          minimumSize: const Size.fromHeight(45),
        ),
        icon: Image.asset(
          'assets/google_logo.png',
          width: 24,
          height: 24,
        ),
        label: const Text(
          "Continue with Google",
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: () {
          // No sign-in functionality here
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Google Sign-In is disabled.")),
          );
        },
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green, // Green background color
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignInScreen(),
            ),
          );
        },
        child: const Text(
          "Sign in",
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
