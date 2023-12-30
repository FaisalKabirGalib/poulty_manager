import 'package:flutter/material.dart';
import 'package:form_helper/form_helper.dart';
import 'package:go_router/go_router.dart';
import 'bank_hishab_add_screen.dart';
import '../../../../../config/constant/constant.dart';
import '../../widgets/add_button.dart';
import '../../widgets/balance_display.dart';
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
              context.pop();
            },
          ),
          KSized.h12,
          KSized.h4,
          const BalanceDisplay(balance: '9807'),
          MakeForm(
              fields: [
                FormHelperDropDown(
                  'bank_name',
                  title: 'ব্যাংক নির্বাচন করুন ',
                  hint: 'ইসলামী ব্যাংক লিঃ',
                  options: {
                    'ইসলামী ব্যাংক লিঃ': 'bank 1',
                    'ব্র্যাক ব্যাংক লিঃ': 'bank 2',
                    'ব্যাংক এশিয়া লিঃ': 'bank 3',
                  },
                ),
                FormHelperTextField(
                  'account_type',
                  title: 'একাউন্ট ধরন',
                  hint: 'কারেন্ট একাউন্ট',
                ),
                FormHelperTextField(
                  'account_number',
                  title: 'একাউন্ট নাম্বার',
                  hint: '১২৩৪৫৬৭৮৯০',
                ),
                FormHelperTextField(
                  'amount',
                  title: 'টাকার পরিমান',
                  hint: '৫০,০০০',
                ),
                FormHelperTextField(
                  'desc',
                  title: 'এই কাউন্টে কোন ঋণ নেই',
                ),
              ],
              onSubmit: (values) {
                debugPrint('On Submit Clicked ${values.toString()}}');
              },
              onCancel: () {
                debugPrint('On Cancel Clicked');
              }),
        ].toColumn().parent(page),

        // Loan Add Button
        Positioned(
          bottom: 20,
          right: 20,
          child: AddButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const BankHishabAddScreen();
              }));
            },
          ),
        ),
      ],
    );
  }
}
