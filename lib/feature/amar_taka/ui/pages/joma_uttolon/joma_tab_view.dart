import 'package:flutter/material.dart';
import 'package:form_helper/form_helper.dart';
import '../../../../../config/constant/constant.dart';
import '../../widgets/balance_display.dart';

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
        // CustomTextField(
        //   label: 'টাকার পরিমান',
        //   hint: '৫০,০০০',
        //   isRequired: true,
        // ),

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
              title: 'জমার তারিখ',
              hint: '১ জানুয়ারি ২০২২',
              isRequired: true,
            ),
            FormHelperDropDown(
              'medium',
              title: 'জমার মাধ্যম',
              hint: 'নগদ',
              options: {
                'cash': 'নগদ',
                'bkash': 'বিকাশ',
              },
            ),
            FormHelperTextField(
              'reason',
              title: 'জমার কারন',
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
      ],
    );
  }
}
