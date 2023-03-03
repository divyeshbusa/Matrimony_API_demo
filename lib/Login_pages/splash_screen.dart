import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:final_matrimony/Login_pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 500,
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        splash: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Lottie.asset('assets/images/splash_screen_proposal.json'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Find your',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '" Someone Special "',
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
        nextScreen: loginPage());
  }
}
