import 'dart:collection';

import 'package:final_matrimony/Login_pages/login_page.dart';
import 'package:final_matrimony/Login_pages/splash_screen.dart';
import 'package:final_matrimony/main/main.dart';
import 'package:final_matrimony/pages/dashboard.dart';
import 'package:final_matrimony/pages/user_list.dart';


import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "fluttser run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home:  SplashScreen(),
    );
  }
}