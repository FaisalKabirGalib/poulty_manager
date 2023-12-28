import 'package:flutter/material.dart';
import 'package:form_helper/sealed/form_sealed.dart';
import 'package:poulty_manager/core/Layout/extension.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../config/constant/constant.dart';
import '../../../config/theme/color.dart';
import '../../../gen/assets.gen.dart';
import '../../vaccine/presentation/style/functions.dart';

class ForgetPasswordInitial extends StatelessWidget {
  const ForgetPasswordInitial({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    return <Widget>[
      // const Spacer(
      //   flex: 1,
      // ),
      Assets.images.forgetPassIcon.image(),
      KSized.h10,
      KSized.h10,
      KSized.h10,
      Styled.text(
              "পাসওয়ার্ড ভুলে গিয়ে থাকলে নিচে আপনার রেজিস্ট্রেশকৃত নাম্বারটি দিন।")
          .textAlignment(TextAlign.center)
          .fontSize(22)
          .fontWeight(FontWeight.bold)
          .textColor(AppColors.blackColor)
          .constrained(
            width: MediaQuery.of(context).size.width * 0.8,
          ),
      KSized.h10,
      Styled.text("প্রদত্ত নাম্বারে একটি কোড পাঠানো হবে।")
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
      FormHelperTextField(
        "phone",
        controller: phoneController,
        title: "মোবাইল নাম্বার",
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
      KSized.h10,
      KSized.h10,
      KSized.h10,
      ElevatedButton(
        style: primaryBtnStyle,
        onPressed: () {
          // TODO: Send OTP
        },
        child: Styled.text("কোড পাঠান")
            .fontSize(18)
            .fontWeight(FontWeight.w600)
            .textColor(Colors.white),
      ).width(double.infinity),
    ]
        .toColumn()
        .padding(all: 20)
        .height(MediaQuery.of(context).size.height)
        .constrained(width: MediaQuery.of(context).size.width)
        .parent(blankPage);
  }
}
