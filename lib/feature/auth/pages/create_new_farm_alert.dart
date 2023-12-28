import 'package:flutter/material.dart';
import 'package:poulty_manager/core/Layout/extension.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../config/constant/constant.dart';
import '../../../config/theme/color.dart';
import '../../../gen/assets.gen.dart';

class CreateNewFarmAlertPage extends StatelessWidget {
  const CreateNewFarmAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      SizedBox(
        // height  =  Height of the whole screen - height of the appbar
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            MediaQuery.of(context).padding.bottom -
            56,
        child: Center(
          child: [
            [
              Assets.images.createFarmImage
                  .image(width: MediaQuery.of(context).size.width * 0.8),
              KSized.h10,
              KSized.h10,
              Styled.text('খামার পরিচালনা শুরু করে দিন এখনই')
                  .textAlignment(TextAlign.center)
                  .fontSize(22)
                  .fontWeight(FontWeight.bold)
                  .textColor(AppColors.blackColor)
                  .constrained(width: MediaQuery.of(context).size.width * 0.9),
            ].toColumn(),
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
                  // TODO: Navigate to Add Farm Page
                },
                child: Styled.text('খামার তৈরি করুন')
                    .fontSize(20)
                    .textColor(Colors.white),
              ).padding(bottom: 30),
              [
                Styled.text('এখন নয়﻿')
                    .textStyle(
                      const TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor,
                        decorationThickness: 2,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    )
                    .fontSize(16)
                    .textColor(AppColors.primaryColor)
                    .gestures(
                  onTap: () {
                    // TODO: Navigate to Home Page
                  },
                ),
              ].toRow().fittedBox().padding(bottom: 30)
            ].toColumn().padding(horizontal: 10)
          ].toColumn(),
        ),
      ),
    ].toColumn().parent(blankPage);
  }
}
