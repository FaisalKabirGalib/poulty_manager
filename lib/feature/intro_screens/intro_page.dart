import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../config/constant/constant.dart';
import '../../config/theme/color.dart';
import 'package:styled_widget/styled_widget.dart';

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
                backgroundColor: Colors.white,
                elevation: 0,
                foregroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(color: AppColors.primaryColor),
              ),
              onPressed: () {},
              child: Styled.text('অ্যাকাউন্টে প্রবেশ করুন')
                  .fontSize(20)
                  .textColor(AppColors.primaryColor),
            ).padding(bottom: 10),
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
              onPressed: () {},
              child: Styled.text('অ্যাকাউন্টে তৈরি করুন')
                  .fontSize(20)
                  .textColor(Colors.white),
            ).padding(bottom: 30),
          ].toColumn().padding(horizontal: 10)
        ].toColumn().padding(horizontal: 40).expanded(),
      ),
    );
  }
}
