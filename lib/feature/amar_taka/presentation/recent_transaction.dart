import 'package:flutter/material.dart';
import 'package:poulty_manager/feature/amar_taka/presentation/widgets/transaction_summary.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../config/constant/constant.dart';
import '../../../core/Layout/extension.dart';
import '../../batch/presentation/functions/utils.dart';

class RecentTransactionScreen extends StatelessWidget {
  const RecentTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      titleWithReturn('সম্প্রতি লেনদেন', onBack: () {
        Navigator.pop(context);
      }),
      KSized.h12,
      ...List.generate(
          18,
          (index) => [
                transactionSummary(),
                KSized.h4,
                const Divider(color: Color(0XFFF3F4F6)),
              ].toColumn().padding(horizontal: 20)),
    ].toColumn().parent(page);
  }
}
