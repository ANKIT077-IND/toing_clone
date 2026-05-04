import 'package:flutter/material.dart';
import 'package:toing_clone/core/style/color_palettes.dart';
import 'package:toing_clone/features/auth/presentation/widgets/on_boarding_screen_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalettes.greenColor,
      body: SafeArea(child: OnBoardingScreenBody()),
    );
  }
}
