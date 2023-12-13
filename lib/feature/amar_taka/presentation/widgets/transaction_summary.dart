import 'package:flutter/material.dart';
import 'package:poulty_manager/config/config.dart';
import 'package:styled_widget/styled_widget.dart';

Widget transactionSummary(
    {name, paymentType, transactionAmount, transactionDate}) {
  return Container(
    child: [
      [
        Styled.text('শেখ মুজিবুর রহমান')
            .fontSize(16)
            .fontWeight(FontWeight.bold),
        Styled.text('পাওনা  (বিকাশ)').textColor(Colors.grey).fontSize(14),
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      [
        Styled.text('+ ৮০০০.০০')
            .textColor(AppColors.successColor)
            .fontSize(16)
            .fontWeight(FontWeight.bold),
        Styled.text('১২ নভেম্বার, ২:৪৫ PM')
            .textColor(Colors.black)
            .fontSize(14),
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.end,
      ),
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    ),
  );
}
