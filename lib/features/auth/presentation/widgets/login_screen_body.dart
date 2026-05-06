import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toing_clone/core/app_router/app_router.dart';
import 'package:toing_clone/core/constent/app_assets_images.dart';
import 'package:toing_clone/core/constent/app_string.dart';
import 'package:toing_clone/core/style/app_font_style.dart';
import 'package:toing_clone/core/style/color_palettes.dart';
import 'package:toing_clone/core/widget/custom_button.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({Key? key}) : super(key: key);

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final formKey = GlobalKey<FormState>();
  TextEditingController mobileNumber = TextEditingController();

  @override
  void dispose() {
    mobileNumber.dispose();
    super.dispose();
  }

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
            width: 1.sw,
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              color: ColorPalettes.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
            ),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  AutoSizeText(
                    AppString.enterYourMobileNumberTo,
                    style: AppFontStyle.subHeading.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  AutoSizeText(
                    AppString.manageOrders,
                    style: AppFontStyle.subHeading.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: mobileNumber,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    style: AppFontStyle.subHeading.copyWith(
                      color: Colors.black,
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(
                          color: ColorPalettes.greenColor,
                          width: 1,
                        ),
                      ),
                      labelText: AppString.mobileNumber,
                      labelStyle: AppFontStyle.body.copyWith(
                        color: ColorPalettes.greenColor,
                        fontWeight: FontWeight.bold,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.w,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(
                          color: ColorPalettes.greenColor,
                          width: 1,
                        ),
                      ),
                      prefix: SizedBox(
                        width: 70.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppAssetsImages.flagImage,
                              height: 18.w,
                              width: 18.w,
                            ),
                            AutoSizeText(
                              '${AppString.countryCode} |',
                              style: AppFontStyle.subHeading.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return AppString.mobileNumberIsRequired;
                      } else if (val.length != 10) {
                        return AppString.mobileNumberMustBeDigits;
                      }
                    },
                  ),
                  Spacer(),
                  SizedBox(
                    width: 1.sh,
                    height: 43.h,
                    child: CustomButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.push(
                            AppRouter.verifyOtpScreen,
                            extra: mobileNumber.text.trim(),
                          );
                        }
                      },
                      buttonName: AppString.continueText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: AutoSizeText.rich(
                      overflow: TextOverflow.ellipsis,
                      style: AppFontStyle.body,
                      TextSpan(
                        text: AppString.iAcceptThe,
                        children: [
                          TextSpan(
                            text: AppString.termsOfServices,
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style: AppFontStyle.body.copyWith(
                              decoration: TextDecoration.underline,
                              color: ColorPalettes.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: " & "),
                          TextSpan(
                            text: AppString.privacyPolicy,
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style: AppFontStyle.body.copyWith(
                              decoration: TextDecoration.underline,
                              color: ColorPalettes.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
