import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie/ongoingBoardScreen/ongoing_board_screen.dart';
import 'home_screen.dart';
class SplashScreen extends StatelessWidget{
  static const String routeName = 'SplashScreen';

  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(OnGoingBoardScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
