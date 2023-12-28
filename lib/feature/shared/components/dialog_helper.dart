import 'package:flutter/material.dart';
import '../../../config/config.dart';
import '../../../config/constant/constant.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../gen/assets.gen.dart';

class DialogHelper {
  static void showAlertDialog(
    BuildContext context,
    String name,
    double amount,
    String transactionId,
    String date,
  ) {
    // Show Dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shadowColor: Colors.grey.shade200,
          elevation: 0,
          content: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.images.appHen.image(
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                          KSized.h8,
                          Styled.text('লেনদেনের  বিস্তারিত')
                              .fontSize(16)
                              .fontWeight(FontWeight.bold)
                              .textColor(AppColors.whiteColor),
                        ],
                      )
                    ],
                  ),
                ),
                KSized.h8,
                KSized.h8,

                // Details
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Styled.text('গ্রহীতার নাম')
                          .textColor(AppColors.black2Color),
                      KSized.h4,
                      Styled.text(name)
                          .fontWeight(FontWeight.bold)
                          .fontSize(16),
                      KSized.h4,
                      const Divider(
                        color: AppColors.dividerColor,
                        indent: 70,
                        endIndent: 70,
                      ),
                      KSized.h4,
                      Styled.text('টাকার পরিমাণ')
                          .textColor(AppColors.black2Color),
                      KSized.h4,
                      Styled.text('৳ ${amount.toStringAsFixed(2)}')
                          .fontWeight(FontWeight.bold)
                          .fontSize(16),
                      KSized.h4,
                      const Divider(
                        color: AppColors.dividerColor,
                        indent: 70,
                        endIndent: 70,
                      ),
                      KSized.h4,
                      Styled.text('ট্রানজেকশন আইডি')
                          .textColor(AppColors.black2Color),
                      KSized.h4,
                      Styled.text(transactionId)
                          .fontWeight(FontWeight.bold)
                          .fontSize(16),
                      KSized.h4,
                      const Divider(
                        color: AppColors.dividerColor,
                        indent: 70,
                        endIndent: 70,
                      ),
                      KSized.h4,
                      Styled.text('তারিখ').textColor(AppColors.black2Color),
                      KSized.h4,
                      Styled.text(date)
                          .fontWeight(FontWeight.bold)
                          .fontSize(16),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // Coming Soon Alert Dialog
  static void showComingSoonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shadowColor: Colors.grey.shade200,
          elevation: 0,
          content: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Use the provided image for "Coming Soon"
                              Assets.images.workInProgress.image(
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                              KSized.h8,
                              Styled.text('Coming Soon')
                                  .fontSize(16)
                                  .fontWeight(FontWeight.bold)
                                  .textColor(AppColors.whiteColor),
                            ],
                          ),
                        ],
                      ),
                    ),
                    KSized.h8,
                    KSized.h8,

                    // Details
                    Align(
                      heightFactor: 1.5,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Styled.text('Stay tuned for exciting updates!')
                              .textColor(AppColors.blackColor)
                              .fontSize(18)
                              .fontWeight(FontWeight.bold),
                          KSized.h8,
                          Styled.text('We are working on something awesome.')
                              .fontSize(14)
                              .textColor(AppColors.black2Color),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(
                    Icons.close_rounded,
                    color: AppColors.whiteColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
