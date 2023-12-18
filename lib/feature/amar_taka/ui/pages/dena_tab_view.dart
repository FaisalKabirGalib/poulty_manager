import 'package:flutter/material.dart';
import 'package:poulty_manager/feature/amar_taka/ui/widgets/transaction_summary.dart';
import 'package:poulty_manager/feature/shared/components/dialog_helper.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../config/constant/constant.dart';
import '../../../../config/theme/color.dart';

class DenaTabView extends StatelessWidget {
  final int itemCount;

  const DenaTabView({Key? key, required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            DialogHelper.showAlertDialog(
              context,
              'শেখ মুজিবুর রহমান',
              1500,
              'SADF44SFD',
              'JAN 20, 02:22 PM',
            );
          },
          child: [
            transactionSummary(),
            KSized.h4,
            const Divider(color: AppColors.dividerColor),
          ].toColumn().padding(horizontal: 20),
        );
      },
    );
  }
}
