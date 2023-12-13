import 'package:flutter/material.dart';
import 'package:poulty_manager/feature/amar_taka/presentation/recent_transaction.dart';
import 'package:poulty_manager/feature/amar_taka/presentation/widgets/carousal_amar_taka.dart';
import 'package:poulty_manager/feature/amar_taka/presentation/widgets/options_container.dart';
import 'package:poulty_manager/feature/amar_taka/presentation/widgets/transaction_summary.dart';
import 'package:poulty_manager/feature/batch/presentation/functions/utils.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../config/constant/constant.dart';
import '../../../core/Layout/extension.dart';

class MyAccountHomePage extends StatelessWidget {
  const MyAccountHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      titleWithReturn('আমার টাকা', onBack: () {
        Navigator.pop(context);
      }),
      KSized.h12,
      carouselItems(),
      KSized.h12,
      KSized.h8,
      optionsContainer(),
      KSized.h12,
      KSized.h4,
      [
        Styled.text('সম্প্রতি লেনদেন').fontSize(20),
        Styled.icon(Icons.arrow_forward).gestures(onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RecentTransactionScreen(),
            ),
          );
        }),
      ]
          .toRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          )
          .padding(horizontal: 20),
      const Divider(
        color: Color(0XFFF3F4F6),
      ),
      KSized.h12,
      ...List.generate(
        10,
        (index) => [
          transactionSummary(),
          KSized.h4,
          const Divider(color: Color(0XFFF3F4F6)),
        ].toColumn().padding(horizontal: 20),
      ),
    ].toColumn().parent(page);
  }
}
