import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toing_clone/core/constent/app_assets_images.dart';
import 'package:toing_clone/core/style/color_palettes.dart';
import 'package:toing_clone/features/auth/presentation/widgets/verify_otp_screen_body.dart';

class VerifyOtpScreen extends StatelessWidget {
  final String mobileNumber;
  const VerifyOtpScreen({required this.mobileNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorPalettes.greenColor,
      appBar: AppBar(
        backgroundColor: ColorPalettes.greenColor,
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Image.asset(
              AppAssetsImages.backImage,
              color: ColorPalettes.whiteColor,
            ),
          ),
        ),
        title: Center(
          child: Image.asset(
            AppAssetsImages.toingImage,
            height: 60.w,
            width: 60.w,
          ),
        ),
      ),
      body: SafeArea(child: VerifyOtpScreenBody(mobileNumber: mobileNumber)),
    );
  }
}
