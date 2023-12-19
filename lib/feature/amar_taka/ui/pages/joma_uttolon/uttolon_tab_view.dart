import 'package:flutter/material.dart';
import 'package:poulty_manager/feature/amar_taka/ui/widgets/balance_display.dart';

import '../../widgets/actions_buttons.dart';

class UttolonTabView extends StatelessWidget {
  const UttolonTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BalanceDisplay(balance: '890'),
        ActionButtons(
          onCancel: () {
            print('On Cancel Clicked');
          },
          onSubmit: () {
            print('On Submit Clicked');
          },
          cancelText: "বাতিল করুন﻿",
          submitText: "উত্তোলন করুন﻿",
        ),
      ],
    );
  }
}
