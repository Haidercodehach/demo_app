import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the Sign In screen after a 2-second delay.
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/signin');
    });
  }

  @override
  Widget build(BuildContext context) {
    // Set the image width to 50% of the screen width for responsiveness.
    double imageWidth = MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            // Center corresponds to 50% horizontally and 0% vertically (top center).
            center: Alignment(0, -1),
            // Adjust the radius to control the spread of the gradient.
            radius: 1.0,
            colors: [
              Color(0xff43B888), // Start color.
              Color(0xff2FA575), // End color.
            ],
            // Stops corresponding to the CSS gradient stops (0% and 85%).
            stops: [0.0, 0.85],
          ),
        ),
        child: Center(
          child: Image.asset(
            'logo.png', // Make sure your asset is located here and declared in pubspec.yaml.
            width: imageWidth,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
