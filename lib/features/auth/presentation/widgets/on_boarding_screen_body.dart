import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toing_clone/core/app_router/app_router.dart';
import 'package:toing_clone/core/constent/app_assets_images.dart';
import 'package:toing_clone/core/constent/app_string.dart';
import 'package:toing_clone/core/style/app_font_style.dart';
import 'package:toing_clone/core/style/color_palettes.dart';
import 'package:toing_clone/core/widget/custom_button.dart';

class OnBoardingScreenBody extends StatelessWidget {
  const OnBoardingScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          right: 5,
          child: CustomButton(
            onTap: () {
              if (context.mounted) {
                context.go(AppRouter.homeScreen);
              }
            },
            buttonName: AppString.skip,
            buttonBackGroundColor: ColorPalettes.greenColor.withAlpha(20),
          ),
        ),
        Positioned(top: 0.1.sh, child: Image.asset(AppAssetsImages.toingImage)),
        Positioned(
          top: 0.2.sh,
          child: AutoSizeText(
            AppString.greatTasteDelivered,
            style: AppFontStyle.subHeading.copyWith(color: Colors.amberAccent),
          ),
        ),
        Positioned(
          top: 0.23.sh,
          child: AutoSizeText(
            AppString.atLowestRate,
            style: AppFontStyle.subHeading.copyWith(color: Colors.amberAccent),
          ),
        ),
        Positioned(
          top: 0.3.sh,
          child: Image.asset(AppAssetsImages.splashImage),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 1.sw,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: ColorPalettes.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17.r),
                topRight: Radius.circular(17.r),
              ),
            ),
            child: Column(
              spacing: 10.w,
              children: [
                SizedBox(height: 10.h),
                SizedBox(
                  width: 0.85.sw,
                  height: 43.h,
                  child: CustomButton(
                    onTap: () {
                      if (context.mounted) {
                        context.push(AppRouter.loginScreen);
                      }
                    },
                    buttonName: AppString.loginWithPhoneNumber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                AutoSizeText.rich(
                  overflow: TextOverflow.ellipsis,
                  style: AppFontStyle.small,
                  TextSpan(
                    text: AppString.byTappingIAcceptThe,
                    children: [
                      TextSpan(
                        text: AppString.termsOfServices,
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: AppFontStyle.small.copyWith(
                          decoration: TextDecoration.underline,
                          color: ColorPalettes.blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: " & "),
                      TextSpan(
                        text: AppString.privacyPolicy,
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: AppFontStyle.small.copyWith(
                          decoration: TextDecoration.underline,
                          color: ColorPalettes.blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
