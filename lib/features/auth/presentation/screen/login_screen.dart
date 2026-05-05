import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toing_clone/core/constent/app_assets_images.dart';
import 'package:toing_clone/core/constent/app_string.dart';
import 'package:toing_clone/core/style/color_palettes.dart';
import 'package:toing_clone/core/widget/custom_button.dart';
import 'package:toing_clone/features/auth/presentation/widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomButton(
              onTap: () {
                if (context.mounted) {}
              },
              buttonName: AppString.skip,
              buttonBackGroundColor: ColorPalettes.greenColor.withAlpha(20),
            ),
          ),
        ],
      ),
      body: SafeArea(child: LoginScreenBody()),
    );
  }
}
