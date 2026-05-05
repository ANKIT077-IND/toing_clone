import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toing_clone/core/constent/app_string.dart';
import 'package:toing_clone/core/style/app_font_style.dart';
import 'package:toing_clone/core/style/color_palettes.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({Key? key}) : super(key: key);

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 10.w,
      children: [
        Center(
          child: AutoSizeText(
            '${AppString.greatTasteDelivered} ${AppString.atLowestRate}',
            style: AppFontStyle.body.copyWith(color: Colors.amberAccent),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: ColorPalettes.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
