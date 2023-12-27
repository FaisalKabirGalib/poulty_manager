// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_helper/form_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poulty_manager/feature/auth/pages/forget_password.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../config/constant/constant.dart';
import '../../../../config/theme/color.dart';
import '../../../../gen/assets.gen.dart';

class SignInInitial extends HookConsumerWidget {
  const SignInInitial({
    super.key,
    required this.onSignIn,
  });
  final void Function(Map<String, dynamic> data) onSignIn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showPassword = useState<bool>(true);
    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();
    return <Widget>[
      const Spacer(
        flex: 1,
      ),
      Assets.images.appHen.image(),
      KSized.h10,
      Styled.text("সাইন ইন").fontSize(24).bold(),

      KSized.h10,
      Styled.text("আপনার অ্যাকাউন্টে প্রবেশ করতে নিচের প্রয়োজনীয় তথ্যগুলো দিন।")
          .textAlignment(TextAlign.center)
          .fontWeight(FontWeight.w500)
          .textColor(AppColors.black2Color)
          .fontSize(16),
      KSized.h10,
      KSized.h10,

      FormHelperTextField(
        "email",
        controller: phoneController,
        title: "ইমেইল",
        noTitleApply: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          hintText: "ইমেইল/ফোন নম্বর",
          hintStyle: const TextStyle(
            color: AppColors.black2Color,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: const Color(0XFFF3F4F6),
          prefixIcon: Assets.images.emailIcon.image(
            color: AppColors.black2Color,
            width: 20,
            height: 20,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ).toWidget,

      KSized.h10,

      FormHelperTextField(
        "password",
        controller: passwordController,
        title: "password",
        noTitleApply: true,
        maxLine: 1,
        obscureText: showPassword.value,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          hintText: "পাসওয়ার্ড",
          hintStyle: const TextStyle(
              color: AppColors.black2Color,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          suffixIcon: showPassword.value
              ? Styled.icon(Icons.visibility_off_outlined,
                      color: Colors.grey.shade500)
                  .gestures(onTap: () {
                  showPassword.value = !showPassword.value;
                })
              : Styled.icon(Icons.visibility_outlined,
                      color: Colors.grey.shade500)
                  .gestures(onTap: () {
                  showPassword.value = !showPassword.value;
                }),
          filled: true,
          fillColor: const Color(0XFFF3F4F6),
          prefixIcon: Assets.images.passwordLock.image(
            color: AppColors.black2Color,
            width: 20,
            height: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ).toWidget,
      KSized.h10,
      Styled.text("পাসওয়ার্ড ভুলে গেছেন?")
          .textColor(AppColors.black2Color)
          .alignment(Alignment.centerRight),
      KSized.h10,
      KSized.h10,
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60),
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if (passwordController.text.isEmpty ||
              phoneController.text.isEmpty ||
              passwordController.text.length < 6 ||
              phoneController.text.length < 11) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Invalid phone or password'),
                backgroundColor: Colors.red,
              ),
            );
            return;
          } else {
            onSignIn({
              "phone": phoneController.text,
              "password": passwordController.text,
            });
          }
        },
        child: Styled.text("অ্যাকাউন্টে প্রবেশ করুন")
            .fontSize(18)
            .fontWeight(FontWeight.w500)
            .textColor(Colors.white),
      ),
      KSized.h10,
      KSized.h10,
      RichText(
        text: TextSpan(
          text: "অ্যাকাউন্ট নেই? ",
          style: const TextStyle(color: AppColors.black2Color),
          children: [
            TextSpan(
              text: "নিবন্ধন করুন",
              style: const TextStyle(color: AppColors.primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  debugPrint("Register");
                  context.go("/auth/register");
                },
            )
          ],
        ),
      ),
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
            .textColor(AppColors.black2Color)
            .alignment(Alignment.center),
        KSized.w12,
        const Divider(
          color: AppColors.black3Color,
        ).expanded(),
        KSized.w12,
      ].toRow(),
      KSized.h10,
      KSized.h10,

      [
        // FACEBOOK SIGN IN BUTTON
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

        // GOOGLE SIGN IN BUTTON
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
