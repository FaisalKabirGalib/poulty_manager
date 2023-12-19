import 'package:flutter/material.dart';
import 'package:poulty_manager/feature/amar_taka/ui/widgets/actions_buttons.dart';
import 'package:poulty_manager/feature/amar_taka/ui/widgets/balance_display.dart';

class JomaTabView extends StatelessWidget {
  const JomaTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BalanceDisplay(balance: '1500'),
        ActionButtons(
          onCancel: () {
            print('On Cancel Clicked');
          },
          onSubmit: () {
            print('On Submit Clicked');
          },
          cancelText: "বাতিল করুন﻿",
          submitText: "জমা করুন",
        ),
      ],
    );
  }
}
