import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../config/theme/color.dart';

class BalanceDisplay extends StatelessWidget {
  final String balance;

  const BalanceDisplay({
    Key? key,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0XFF00B74A).withOpacity(0.2),
        ),
        color: const Color(0XFF00B74A).withOpacity(0.1),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styled.text('বর্তমান ব্যালেন্স').fontSize(16),
              Styled.text('৳ $balance')
                  .textColor(AppColors.successColor)
                  .fontSize(24)
                  .fontWeight(FontWeight.bold),
            ],
          ),
        ),
      ),
    );
  }
}
