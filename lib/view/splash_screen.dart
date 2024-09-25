import 'package:assignment_test/controller/weight/bottam_navigation_br.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'package:dio/dio.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Fade-in animation setup
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    // Start the animation
    _animationController.forward();

    // Navigate after the delay
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) =>  BottomNavScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            // Optional: Add gradient or background color
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lottie animation
              Lottie.asset(
                'assets/animation.json', // Add your lottie file path here
                width: 400,
                height: 400,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 20),

              // Fade-in image animation
              
             

              // Fade-in text animation
             
            ],
          ),
        ),
      ),
    );
  }
}
