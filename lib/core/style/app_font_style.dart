import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toing_clone/core/style/color_palettes.dart';

class AppFontStyle {
  static TextStyle heading = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20.sp,
    color: ColorPalettes.blackColor,
  );
  static TextStyle subHeading = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
    color: ColorPalettes.blackColor,
  );
  static TextStyle body = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14.sp,
    color: ColorPalettes.blackColor,
  );
  static TextStyle small = TextStyle(
    fontSize: 12.sp,
    color: ColorPalettes.blackColor,
  );
}
