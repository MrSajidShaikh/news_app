import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/View/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    });
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: h * 0.1,
          width: w * 0.51,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/twitter_logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
