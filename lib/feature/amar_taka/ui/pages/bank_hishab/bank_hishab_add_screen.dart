import 'package:flutter/material.dart';
import 'package:form_helper/form_helper.dart';
import 'package:go_router/go_router.dart';
import '../../../../../config/constant/constant.dart';
import '../../../../batch/presentation/functions/utils.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../../core/Layout/extension.dart';

class BankHishabAddScreen extends StatelessWidget {
  const BankHishabAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return [
      titleWithBackArrowAndAction(
        'ব্যাংক হিসাব',
        'এই সেকশন আপনার ফার্মের টাকা জমা করতে পারবেন এবং টাকা উত্তোলন করতে পারবেন।',
        onBack: () {
          context.pop();
        },
      ),
      KSized.h12,
      KSized.h4,
      MakeForm(
        fields: [
          FormHelperTextField(
            'ব্যাংক এর নাম লিখুন',
            title: 'ইসলামী ব্যাংক লিঃ',
            isRequired: true,
          ),
          FormHelperDropDown(
            'account_type',
            title: 'কারেন্ট একাউন্ট',
            options: {
              'কারেন্ট একাউন্ট': 'bank 1',
              'সেভিংস একাউন্ট': 'bank 2',
              'ফিক্সড ডিপোজিট': 'bank 3',
            },
            hint: 'কারেন্ট একাউন্ট',
          ),
          FormHelperTextField(
            'account_number',
            title: 'একাউন্ট নাম্বার',
            hint: '১২৩৪৫৬৭৮৯০',
          ),
          FormHelperTextField('amount',
              title: 'টাকার পরিমান',
              hint: '৫০,০০০',
              suffix: const Text(
                'টাকা',
                style: TextStyle(color: Colors.black),
              )),
          FormHelperRadio('loan', title: 'কোনো ঋন আছে?', option: {
            'হ্যাঁ': 'yes',
            'না': 'no',
          }),
        ],
        onSubmit: (values) {
          debugPrint('On Submit Clicked ${values.toString()}}');
        },
        onCancel: () {
          debugPrint('On Cancel Clicked');
        },
      ),
    ].toColumn().parent(page);
  }
}
