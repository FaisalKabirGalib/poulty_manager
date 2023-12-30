import 'package:flutter/material.dart';
import 'package:form_helper/sealed/form_sealed.dart';
import 'package:form_helper/widget/make_form.dart';
import '../../widgets/balance_display.dart';

class BatchHishabTabView extends StatelessWidget {
  const BatchHishabTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BalanceDisplay(balance: '1500'),
        MakeForm(
          fields: [
            FormHelperDropDown(
              'name',
              title: 'কর্মী নির্বাচন করুন',
              hint: 'জাহিদ আব্দুল্লাহ',
              options: {
                'জাহিদ আব্দুল্লাহ': 'jahid',
                'শাহীন আহমেদ': 'shahin',
              },
            ),
            FormHelperTextField(
              'type',
              title: 'কর্মীর ধরন',
              hint: 'স্থায়ী',
            ),

            // Batch ID should be under Condition
            FormHelperTextField(
              'batchID',
              title: 'ব্যাচ আইডি',
              hint: '৪৪৭৪২৫',
              isRequired: true,
            ),
            FormHelperTextField(
              'bonus',
              title: 'বোনাস (যদি থাকে)',
              hint: '১০,০০০',
              suffix: const Text('টাকা', style: TextStyle(color: Colors.black)),
            ),
            FormHelperDatePicker(
              'date',
              title: 'পরিশোধের তারিখ',
              hint: '১ জানুয়ারি ২০২২',
              isRequired: true,
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
