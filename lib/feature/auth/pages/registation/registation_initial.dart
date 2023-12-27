// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_helper/form_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:styled_widget/styled_widget.dart';

import '/config/constant/constant.dart';
import '/config/theme/color.dart';
import '/feature/vaccine/presentation/style/functions.dart';
import '/gen/assets.gen.dart';

class RegistrationInitial extends HookWidget {
  const RegistrationInitial({
    Key? key,
    required this.onRegistration,
  }) : super(key: key);

  final Function(String phone) onRegistration;

  @override
  Widget build(BuildContext context) {
    final phoneController = useTextEditingController();
    return <Widget>[
      const Spacer(
        flex: 1,
      ),
      Assets.images.appHen.image(),
      KSized.h10,
      Styled.text("নিবন্ধন করুন")
          .fontSize(20)
          .fontWeight(FontWeight.w600)
          .textColor(AppColors.blackColor),
      KSized.h10,

      Styled.text("আপনার অ্যাকাউন্ট তৈরি করতে নিচের প্রয়োজনীয় তথ্যগুলো দিন।")
          .textAlignment(TextAlign.center)
          .fontSize(16)
          .fontWeight(FontWeight.w400)
          .textColor(AppColors.black2Color)
          .alignment(Alignment.center)
          .constrained(
            width: MediaQuery.of(context).size.width * 0.9,
          ),
      KSized.h10,
      KSized.h10,
      KSized.h10,

      FormHelperTextField(
        "phone",
        controller: phoneController,
        title: "ইমেইল",
        noTitleApply: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          hintText: "মোবাইল নাম্বার",
          prefixIcon: Assets.icons.callIcon.image(
            color: AppColors.black2Color,
            width: 20,
            height: 20,
          ),
          hintStyle: const TextStyle(
              color: AppColors.black2Color,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          filled: true,
          fillColor: const Color(0XFFF3F4F6),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ).toWidget,

      KSized.h10,
      KSized.h10,
      KSized.h10,
      ElevatedButton(
        style: primaryBtnStyle,
        onPressed: () {
          if (phoneController.text.isEmpty ||
              phoneController.text.length < 11) {
            // show snakebar;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("মোবাইল নাম্বার দিন"),
              ),
            );
            return;
          }
          onRegistration("88${phoneController.text}");
        },
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
          text: "আগে থেকেই অ্যাকাউন্ট রয়েছে ? ",
          style: const TextStyle(
              color: AppColors.black2Color,
              fontWeight: FontWeight.w400,
              fontSize: 16),
          children: [
            TextSpan(
              text: " প্রবেশ করুন",
              style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.go('/auth/login');
                },
            )
          ],
        ),
      ),
      KSized.h10,
      KSized.h10,

      // MAKE A OR DIVIDER
      [
        KSized.w12,
        const Divider(
          color: AppColors.black3Color,
        ).expanded(),
        KSized.w12,
        Styled.text("অথবা")
            .fontSize(14)
            .textColor(
              AppColors.black2Color,
            )
            .alignment(Alignment.center),
        KSized.w12,
        const Divider(
          color: AppColors.black3Color,
        ).expanded(),
        KSized.w12,
      ].toRow(),
      KSized.h10,
      KSized.h10,
      // GOOGLE SIGN IN BUTTON
      [
        [
          Assets.icons.facebookIcon.svg(
            height: 30,
            width: 30,
          ),
          KSized.w10,
          Styled.text("Facebook")
              .textColor(const Color(0XFF61677D))
              .fontSize(16)
              .fontWeight(FontWeight.w500)

          // FACEBOOK SIGN IN BUTTON
        ]
            .toRow()
            .padding(all: 10)
            .decorated(
              color: AppColors.white3Color,
              borderRadius: BorderRadius.circular(16),
            )
            .constrained(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 60,
            ),
        [
          Assets.icons.googleIcon.svg(
            height: 30,
            width: 30,
          ),
          KSized.w10,
          Styled.text("Google")
              .textColor(const Color(0XFF61677D))
              .fontSize(16)
              .fontWeight(FontWeight.w500)

          // FACEBOOK SIGN IN BUTTON
        ]
            .toRow()
            .padding(all: 10)
            .decorated(
              color: AppColors.white3Color,
              borderRadius: BorderRadius.circular(16),
            )
            .constrained(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 60,
            ),
      ].toRow(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      const Spacer(
        flex: 2,
      ),
    ]
        .toColumn()
        .height(MediaQuery.of(context).size.height)
        .padding(all: 20)
        .scrollable();
  }
}
