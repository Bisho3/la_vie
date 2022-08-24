import 'dart:async';

import 'package:flutter/material.dart';
import 'package:la_vie/layout/home/home_screen.dart';
import 'package:la_vie/modulrs/login/login_screen.dart';
import 'package:la_vie/shared/components/constant.dart';

class SplashScreen extends StatefulWidget {
  Widget? widget;

  SplashScreen({Key? key, this.widget}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // موقت
  late Timer timer;

  // 1
  @override
  void initState() {
    super.initState();
    // 3 sec and move
    timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  accessToken != null ? HomeScreen() : LoginScreen()));
    });
  }

// اغلاق الموقت قبل اغلاق الصفحة
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/lavie_splash.png'),
        ),
      ),
    );
  }
}
