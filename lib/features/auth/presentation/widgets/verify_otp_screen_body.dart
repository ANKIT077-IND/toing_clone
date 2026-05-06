import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:toing_clone/core/app_router/app_router.dart';
import 'package:toing_clone/core/constent/app_string.dart';
import 'package:toing_clone/core/style/app_font_style.dart';
import 'package:toing_clone/core/style/color_palettes.dart';
import 'package:toing_clone/core/widget/custom_button.dart';

class VerifyOtpScreenBody extends StatefulWidget {
  final String mobileNumber;
  const VerifyOtpScreenBody({required this.mobileNumber, super.key});

  @override
  State<VerifyOtpScreenBody> createState() => _VerifyOtpScreenBodyState();
}

class _VerifyOtpScreenBodyState extends State<VerifyOtpScreenBody> {
  final formKey = GlobalKey<FormState>();
  TextEditingController otp = TextEditingController();
  int secondsRemaining = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    secondsRemaining = 60;
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (time) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    otp.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 40.w,
      height: 40.w,
      textStyle: AppFontStyle.body.copyWith(
        color: ColorPalettes.greenColor,
        fontSize: 20.sp,
        fontWeight: FontWeight.w800,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(20.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: ColorPalettes.greenColor.withAlpha(150),
        width: 2,
      ),
      borderRadius: BorderRadius.circular(20.r),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: ColorPalettes.greenColor, width: 2),
        borderRadius: BorderRadius.circular(20.r),
      ),
    );

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
                    AppString.enterVerificationCode,
                    style: AppFontStyle.subHeading.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AutoSizeText(
                    '${AppString.sentTo} ${AppString.countryCode} ${widget.mobileNumber}',
                    style: AppFontStyle.body.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Pinput(
                    controller: otp,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    length: 6,
                    textInputAction: TextInputAction.next,
                    pinAnimationType: PinAnimationType.slide,
                    separatorBuilder: (index) => const SizedBox(width: 8),
                    onChanged: (val) {
                      if (val.length == 6) {
                        context.go(AppRouter.homeScreen);
                      }
                    },
                  ),
                  Spacer(),
                  AutoSizeText.rich(
                    TextSpan(
                      text: AppString.getVerificationCodeAgainIn,
                      children: [
                        TextSpan(
                          text: '${"00 :"} $secondsRemaining',
                          style: AppFontStyle.body.copyWith(
                            color: ColorPalettes.greenColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    style: AppFontStyle.body.copyWith(
                      color: ColorPalettes.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    crossAxisAlignment: .center,
                    spacing: 10.w,
                    children: [
                      SizedBox(
                        height: 43.h,
                        width: 0.44.sw,
                        child: CustomButton(
                          onTap: () {},
                          buttonName: AppString.getViaSMS,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 43.h,
                        width: 0.44.sw,
                        child: CustomButton(
                          onTap: () {},
                          buttonName: AppString.getViaCall,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
