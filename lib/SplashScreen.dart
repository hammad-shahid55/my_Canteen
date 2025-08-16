import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:canteen_final/StartPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? _logoController;
  AnimationController? _loadingController;
  Animation<double>? _logoFadeIn;
  Animation<double>? _taglineFloat;

  @override
  void initState() {
    super.initState();

    // Logo Animation Controller
    _logoController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..forward().whenComplete(() {
        // Navigate to StartPage after animation completes
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StartPage()),
        );
      });

    // Loading Indicator Controller
    _loadingController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();

    // Fade in animation for the logo
    _logoFadeIn = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _logoController!,
        curve: Interval(0.1, 0.5, curve: Curves.easeIn),
      ),
    );

    // Floating effect for tagline
    _taglineFloat = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(
        parent: _logoController!,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    _logoController!.dispose();
    _loadingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Blur Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 41, 10).withAlpha(255),
                  Color.fromARGB(255, 242, 130, 45).withOpacity(0.5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(color: Colors.transparent),
            ),
          ),
          // Logo and Tagline
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeTransition(
                  opacity: _logoFadeIn!,
                  child: Image.asset(
                    'assets/chef.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                SizedBox(height: 20),
                AnimatedBuilder(
                  animation: _taglineFloat!,
                  builder: (_, __) {
                    return Transform.translate(
                      offset: Offset(0, sin(_taglineFloat!.value) * 2),
                      child: Text(
                        "Order Fast, Eat Fresh...!!",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 8, 5, 8),
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(224, 242, 196, 144),
                              blurRadius: 4,
                              offset: Offset(1, 2),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Custom Loading Indicator
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedBuilder(
                animation: _loadingController!,
                builder: (_, __) {
                  return Transform.translate(
                    offset:
                        Offset(0, sin(_loadingController!.value * 2 * pi) * 5),
                    child: Transform.rotate(
                      angle: _loadingController!.value * 2 * pi,
                      child: Icon(
                        Icons.restaurant_menu,
                        color: Color.fromARGB(255, 240, 98, 4),
                        size: 50,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
