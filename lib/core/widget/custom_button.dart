import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:toing_clone/core/style/app_font_style.dart';
import 'package:toing_clone/core/style/color_palettes.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonName;
  final Color buttonColor;
  final Color buttonBackGroundColor;
  final double radius;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomButton({
    super.key,
    required this.onTap,
    this.buttonColor = ColorPalettes.whiteColor,
    required this.buttonName,
    this.radius = 25,
    this.buttonBackGroundColor = ColorPalettes.greenColor,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonBackGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),

      child: AutoSizeText(
        buttonName,
        style: AppFontStyle.body.copyWith(
          color: buttonColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
