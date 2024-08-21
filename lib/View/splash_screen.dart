import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(
        seconds: 4,
      ),
          () {
        Get.toNamed('/home');
      },
    );
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 310,
              child: Image.network(
                'https://direct.dailyhunt.in/assets/selfserve/img/dailyhunt-logo-white.png',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const CircularProgressIndicator(
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}