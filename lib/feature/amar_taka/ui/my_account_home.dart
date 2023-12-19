import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/recent_transaction/recent_transaction.dart';
import 'widgets/carousal_amar_taka.dart';
import 'widgets/options_container.dart';
import 'widgets/transaction_summary.dart';
import '../../batch/presentation/functions/utils.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../config/constant/constant.dart';
import '../../../config/theme/color.dart';
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
      optionsContainer(context),
      KSized.h12,
      KSized.h4,
      [
        Styled.text('সম্প্রতি লেনদেন').fontSize(20),
        Styled.icon(Icons.arrow_forward).gestures(
          onTap: () {
            // context.push('/recent-transactions');
            // GoRouter.of(context).push('/recent-transactions');

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const RecentTransactionScreen();
            }));
          },
        ),
      ]
          .toRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          )
          .padding(horizontal: 20),
      const Divider(
        color: AppColors.dividerColor,
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
