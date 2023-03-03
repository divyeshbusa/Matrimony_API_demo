import 'dart:ui';

import 'package:flutter/material.dart';

class preLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: (Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/bg_matrimony_prelogin.jpg',
                    color: Color.fromRGBO(255, 200, 225, 0.9),
                    colorBlendMode: BlendMode.modulate,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                      child: Text(
                        'INDIA\'S \nMOST TRUSTED \nMATRIMONY BRAND',
                        style: TextStyle(fontSize: 30, height: 1,fontFamily: 'Raleway-Bold'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(65, 170, 65, 520),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black)),
                    ),
                    child: Text(
                      'BY THE BRAND TRUST REPORT 2014',
                      style: TextStyle(fontSize: 15, height: 1.25,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.pinkAccent,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'SIGNUP',
                              style: TextStyle(
                                  color: Colors.pinkAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Icon(Icons.arrow_right_alt, color: Colors.pinkAccent),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
