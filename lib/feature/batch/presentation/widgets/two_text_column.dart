// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../../config/constant/constant.dart';
import 'package:styled_widget/styled_widget.dart';

import '/config/config.dart';

class TwoTextColumn extends StatelessWidget {
  final String uppertext;
  final String lowerText;
  const TwoTextColumn({
    super.key,
    required this.uppertext,
    required this.lowerText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Styled.text(uppertext).fontSize(12),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 6,
            ),
            color: AppColors.primaryColor,
            child: Styled.text(lowerText)
                .textColor(AppColors.whiteColor)
                .fontSize(12),
          ),
        ),
      ],
    ).padding(all: 6).decorated(
          border: Border.all(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        );
  }
}

class BatchSmallCardShow extends StatelessWidget {
  const BatchSmallCardShow({
    Key? key,
    required this.title,
    required this.value,
    required this.image,
    required this.backgroundImage,
  }) : super(key: key);
  final String title;
  final String value;
  final Widget image;
  final Widget backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryColor),
        color: Colors.white,
      ),
      child: [
        const SizedBox(
          width: 4,
        ),
        [
          Styled.text(title)
              .fontSize(12)
              .fontWeight(FontWeight.w500)
              .fittedBox(),
          Styled.text(value)
              .fontSize(12.5)
              .fontWeight(FontWeight.w500)
              .textColor(Colors.grey[500])
              .fittedBox(),
        ].toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center),
        KSized.w4,
        image.height(30).width(30),
        KSized.w4,
      ].toRow(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}

//         Styled.text(uppertext).fontSize(12),
//         Styled.text(lowerText)
//             .fontSize(12)
//             .padding(horizontal: 6, vertical: 2)
//             .decorated(
//               color: AppColors.primaryColor,
//             )
//       ]
//           .toColumn(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           )
//           .constrained(
//             minHeight: 40,

//           ),
