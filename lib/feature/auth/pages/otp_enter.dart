// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:poulty_manager/app/app.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../config/constant/constant.dart';
import '../../../config/theme/color.dart';
import '../../../core/Layout/extension.dart';
import '../../../gen/assets.gen.dart';
import '../../vaccine/presentation/style/functions.dart';

class OTPEnterScreen extends HookConsumerWidget {
  const OTPEnterScreen({
    Key? key,
    required this.phone,
    required this.otp,
  }) : super(key: key);

  final String phone;
  final String otp;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return <Widget>[
      const Spacer(
        flex: 1,
      ),
      Assets.icons.otpIcon.svg(),
      KSized.h10,
      KSized.h10,
      KSized.h10,
      Styled.text("আপনার দেওয়া মোবাইল নাম্বারে একটি কোড গিয়েছে $otp")
          .textAlignment(TextAlign.center)
          .fontSize(22)
          .fontWeight(FontWeight.bold)
          .textColor(AppColors.blackColor)
          .constrained(
            width: MediaQuery.of(context).size.width * 0.8,
          ),
      KSized.h10,
      Styled.text("কোডটি নিচে লিখুন")
          .textAlignment(TextAlign.center)
          .fontSize(14)
          .textColor(AppColors.black2Color)
          .alignment(Alignment.center)
          .constrained(
            width: MediaQuery.of(context).size.width * 0.8,
          ),
      KSized.h10,
      KSized.h10,
      KSized.h10,
      PinCodeTextField(
        appContext: context,
        length: 4,
        onCompleted: (value) {
          if (otp == value) {
            context.go(
              Uri(
                path: '/auth/account-complete',
                queryParameters: {'phone': phone, 'otp': otp},
              ).toString(),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("OTP ভুল হয়েছে"),
              ),
            );
          }
        },
        pinTheme: PinTheme(
          // shape: PinCodeFieldShape.box,
          // borderRadius: BorderRadius.circular(5),
          // fieldWidth: 50,
          // borderWidth: 1,
          // inactiveColor: Colors.grey[300],
          // activeColor: AppColors.primaryColor,
          // selectedColor: AppColors.primaryColor,
          fieldHeight: 60,
          fieldWidth: 60,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          borderWidth: 1,

          inactiveFillColor: AppColors.primaryColor,
          activeFillColor: AppColors.primaryColor,
          selectedFillColor: AppColors.primaryColor,

          inactiveBorderWidth: 1,
          selectedBorderWidth: 2,
          activeBorderWidth: 2,

          activeColor: AppColors.primaryColor,
          inactiveColor: AppColors.primaryColor,
          selectedColor: AppColors.primaryColor,

          activeBoxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
          inActiveBoxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
        ),
      ),
      Styled.text("নাম্বার পরিবর্তন করুন")
          .textColor(AppColors.black2Color)
          .alignment(Alignment.centerRight),
      KSized.h10,
      KSized.h10,
      ElevatedButton(
        style: primaryBtnStyle,
        onPressed: () {},
        child: [
          Styled.text("পরবর্তী")
              .fontSize(18)
              .fontWeight(FontWeight.w600)
              .textColor(Colors.white),
          KSized.w4,
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 20,
          ),
        ].toRow(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ).width(double.infinity),
      KSized.h10,
      KSized.h10,
      RichText(
        text: TextSpan(
          text: "কোডটি না পেয়ে থাকলে ",
          style: const TextStyle(color: AppColors.black2Color),
          children: [
            TextSpan(
              text: "এখানে ক্লিক করুন",
              style: const TextStyle(color: AppColors.primaryColor),
              recognizer: TapGestureRecognizer()..onTap = () {},
            )
          ],
        ),
      ).alignment(Alignment.centerLeft),
      KSized.h10,
      const Spacer(
        flex: 2,
      ),
    ]
        .toColumn()
        .height(MediaQuery.of(context).size.height)
        .padding(all: 20)
        .constrained(
          height: MediaQuery.of(context).size.height,
        )
        .parent(blankPage);
  }
}
