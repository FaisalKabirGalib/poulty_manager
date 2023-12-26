import 'package:flutter/material.dart';
import '../../../../../config/constant/constant.dart';
import '../../widgets/actions_buttons.dart';
import '../../widgets/balance_display.dart';
import '../../../../shared/components/custom_textfield.dart';

class JomaTabView extends StatelessWidget {
  JomaTabView({super.key});

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BalanceDisplay(balance: '1500'),
        KSized.h12,
        KSized.h8,
        CustomTextField(
          label: 'টাকার পরিমান',
          hint: '৫০,০০০',
          isRequired: true,
        ),
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
