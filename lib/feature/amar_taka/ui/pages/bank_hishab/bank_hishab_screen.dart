import 'package:flutter/material.dart';
import 'package:poulty_manager/config/constant/constant.dart';
import 'package:poulty_manager/config/theme/color.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/kormi_list_screen.dart';
import 'package:poulty_manager/feature/amar_taka/ui/widgets/add_button.dart';
import 'package:poulty_manager/feature/amar_taka/ui/widgets/balance_display.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../../core/Layout/extension.dart';
import '../../../../batch/presentation/functions/utils.dart';

class BankHishabScreen extends StatelessWidget {
  const BankHishabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        [
          titleWithBackArrowAndAction(
            'ব্যাংক হিসাব',
            'এই সেকশন আপনার ফার্মের ব্যাংক হিসাব যুক্ত করুন ওনিয়মিত হিসাব সংরক্ষণ করুন।',
            onBack: () {
              Navigator.pop(context);
            },
          ),
          KSized.h12,
          KSized.h4,
          const BalanceDisplay(balance: '9807'),
        ].toColumn().parent(page),

        // Loan Add Button
        Positioned(
          bottom: 20,
          right: 20,
          child: AddButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const KormiListScreen();
              }));
            },
          ),
        ),
      ],
    );
  }
}
