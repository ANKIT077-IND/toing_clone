import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toing_clone/core/app_router/app_router.dart';
import 'package:toing_clone/core/style/color_palettes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splashTimer() {
    Future.delayed(Duration(seconds: 3), () {
      if (context.mounted) {
        context.replace(AppRouter.onBoardingScreen);
      }
    });
  }

  @override
  void initState() {
    splashTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorPalettes.greenColor);
  }
}
