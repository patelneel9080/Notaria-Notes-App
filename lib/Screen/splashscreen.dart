import 'dart:async';

import 'package:bottam/Images/images.dart';
import 'package:bottam/Pages/firstpage.dart';
import 'package:bottam/Screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), ()async {
      SharedPreferences pref =
          await SharedPreferences.getInstance();
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => (isLogin) ? const HomePage():const FirstPage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssetsImg.assistant1,height: 124),
            Text("NOTARIA",style: GoogleFonts.actor(fontSize: 32,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
