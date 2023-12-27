import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_helper/form_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:poulty_manager/config/constant/constant.dart';
import 'package:poulty_manager/core/Layout/extension.dart';
import '../../vaccine/presentation/style/functions.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../config/theme/color.dart';
import '../../../gen/assets.gen.dart';

class AccountCompletePage extends HookWidget {
  const AccountCompletePage({super.key, required this.onRegister});

  final void Function(Map<String, dynamic>) onRegister;

  @override
  Widget build(BuildContext context) {
    final isChecked = useState(false);
    // make controller for name, password,confirm_password, ref_id, and person_type state
    final nameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final conformController = useTextEditingController();
    final refIdController = useTextEditingController();

    final userType = useState<String?>(null);

    return <Widget>[
      const Spacer(
        flex: 1,
      ),
      Styled.text("অ্যাকাউন্ট সম্পন্ন করুন")
          .fontSize(20)
          .fontWeight(FontWeight.w600)
          .textAlignment(TextAlign.center)
          .textColor(AppColors.blackColor),
      KSized.h12,
      Styled.text("আপনার অ্যাকাউন্ট তৈরি করতে নিচের প্রয়োজনীয় তথ্যগুলো দিন।")
          .fontSize(16)
          .fontWeight(FontWeight.w500)
          .textAlignment(TextAlign.center)
          .textColor(AppColors.black2Color)
          .constrained(
            width: MediaQuery.of(context).size.width * 0.9,
          ),
      KSized.h12,
      KSized.h12,
      FormHelperTextField(
        "name",
        title: "name",
        controller: nameController,
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
          hintText: "আপনার পুরো নাম",
          prefixIcon: Assets.images.personOutline.image(
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
      KSized.h12,
      FormHelperTextField(
        "password",
        title: "pass",
        controller: passwordController,
        noTitleApply: true,
        obscureText: true,
        maxLine: 1,
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
          prefixIcon: Assets.images.passwordLock.image(
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
      KSized.h12,
      KSized.h12,
      FormHelperTextField(
        "conform_password",
        title: "pass",
        obscureText: true,
        controller: conformController,
        noTitleApply: true,
        maxLine: 1,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          hintText: "পাসওয়ার্ড নিশ্চিত করুন",
          prefixIcon: Assets.images.passwordLock.image(
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
      KSized.h12,
      FormHelperTextField(
        "ref_id",
        title: "ref_id",
        controller: refIdController,
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
          hintText: "রেফারেল আইডি (যদি থাকে)",
          prefixIcon: Assets.images.callIcon.image(
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
      KSized.h12,
      FormHelperRadio(
        "role",
        title: "আপনি একজন?",
        onChanged: (value) => userType.value = value,
        option: {"খামারি": "1", "ক্রেতা": "0", "টিম মেম্বার": "2"},
        titleStyle: const TextStyle(
          color: AppColors.black2Color,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        optionStyle: const TextStyle(
          color: AppColors.blackColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ).toWidget.padding(left: 10),
      [
        Checkbox(
          activeColor: AppColors.primaryColor,
          value: isChecked.value,
          onChanged: (val) {
            isChecked.value = !isChecked.value;
          },
        ),
        RichText(
          text: const TextSpan(
            text: "I accept ",
            style: TextStyle(color: AppColors.black2Color, fontSize: 12),
            children: [
              TextSpan(
                text: "Terms and conditions",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: " & privacy policy ",
                style: TextStyle(color: AppColors.black2Color, fontSize: 12),
              )
            ],
          ),
        ).expanded(),
      ].toRow(mainAxisAlignment: MainAxisAlignment.start),
      KSized.h10,
      ElevatedButton(
        onPressed: () {
          //if any controller or value is empty , password and confirm password is not match and isCheck is false then return
          if (nameController.text.isEmpty ||
              passwordController.text.isEmpty ||
              refIdController.text.isEmpty ||
              userType.value == null ||
              !isChecked.value) {
            // show snack-bar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("সব তথ্য দিন"),
              ),
            );
            return;
          } else {
            if (passwordController.text != conformController.text) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("পাসওয়ার্ড মিলছে না"),
                ),
              );
              return;
            } else {
              onRegister(
                {
                  "name": nameController.text,
                  "password": passwordController.text,
                  "password_confirmation": conformController.text,
                  "ref_id": refIdController.text,
                  "role": userType.value,
                },
              );
            }
          }

          // call onRegister function
        },
        style: primaryBtnStyle,
        child: Styled.text("অ্যাকাউন্টে তৈরি করুন")
            .fontSize(18)
            .fontWeight(FontWeight.w600)
            .textColor(Colors.white),
      ).width(double.infinity),
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
