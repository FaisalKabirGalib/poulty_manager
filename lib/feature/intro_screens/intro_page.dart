import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poulty_manager/config/config.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../config/constant/constant.dart';

class IntroPage extends StatelessWidget {
  final String heading;
  final String subheading;
  final ImageProvider<Object> image;

  const IntroPage({
    Key? key,
    required this.heading,
    required this.subheading,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: [
          Image(image: image).padding(top: 100),
          KSized.h12,
          KSized.h12,
          Styled.text(heading)
              .textAlignment(TextAlign.center)
              .fontSize(24)
              .bold(),
          KSized.h8,
          Styled.text(subheading)
              .textAlignment(TextAlign.center)
              .fontSize(16)
              .textColor(AppColors.black2Color),
          const Spacer(),
          [
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
                context.goNamed(AppRouteName.register.name);
              },
              child: Styled.text('অ্যাপটি ঘুরে দেখুন')
                  .fontSize(20)
                  .textColor(Colors.white),
            ).padding(bottom: 30),
            [
              Styled.text('আগে থেকেই অ্যাকাউন্ট রয়েছে?')
                  .fontSize(16)
                  .textColor(AppColors.black2Color),
              KSized.w4,
              Styled.text(' প্রবেশ করুন')
                  .fontSize(16)
                  .textColor(AppColors.primaryColor)
                  .gestures(
                onTap: () {
                  context.goNamed(AppRouteName.login.name);
                },
              ),
            ].toRow().fittedBox().padding(bottom: 30)
          ].toColumn().padding(horizontal: 10)
        ].toColumn().padding(horizontal: 40).expanded(),
      ),
    );
  }
}
