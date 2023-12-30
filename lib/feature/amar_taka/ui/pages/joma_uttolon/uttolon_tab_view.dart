import 'package:flutter/material.dart';
import 'package:form_helper/sealed/form_sealed.dart';
import 'package:form_helper/widget/make_form.dart';
import 'package:poulty_manager/feature/amar_taka/ui/widgets/balance_display.dart';

import '../../widgets/actions_buttons.dart';

class UttolonTabView extends StatelessWidget {
  const UttolonTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BalanceDisplay(balance: '890'),

        MakeForm(
          fields: [
            FormHelperTextField(
              'amount',
              title: 'টাকার পরিমান',
              hint: '৫০,০০০',
              isRequired: true,
            ),
            FormHelperDatePicker(
              'date',
              title: 'উত্তোলনের তারিখ',
              hint: '১ জানুয়ারি ২০২২',
              isRequired: true,
            ),
            FormHelperDropDown(
              'medium',
              title: 'উত্তোলনের মাধ্যম',
              hint: 'নগদ',
              options: {
                'cash': 'নগদ',
                'bkash': 'বিকাশ',
              },
            ),
            FormHelperTextField(
              'reason',
              title: 'উত্তোলনের কারন',
              hint: 'আপডেট হবে',
            ),
          ],
          onSubmit: (values) {
            debugPrint('On Submit Clicked ${values.toString()}}');
          },
          onCancel: () {
            debugPrint('On Cancel Clicked');
          },
        ),

        // ActionButtons(
        //   onCancel: () {
        //     print('On Cancel Clicked');
        //   },
        //   onSubmit: () {
        //     print('On Submit Clicked');
        //   },
        //   cancelText: "বাতিল করুন﻿",
        //   submitText: "উত্তোলন করুন﻿",
        // ),
      ],
    );
  }
}
