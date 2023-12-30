import 'package:flutter/material.dart';
import 'package:poulty_manager/config/constant/constant.dart';
import 'package:poulty_manager/feature/kormi_list/kormi_list_details.dart';
import 'package:poulty_manager/feature/amar_taka/ui/widgets/actions_buttons.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/Layout/extension.dart';
import '../batch/presentation/functions/utils.dart';

class KormiListScreen extends StatelessWidget {
  const KormiListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return [
      titleWithBackArrowAndAction(
        'কর্মী লিস্ট',
        'এই সেকশন আপনার ফার্মের টাকা জমা করতে পারবেন এবং টাকা উত্তোলন করতে পারবেন।',
        onBack: () {
          Navigator.pop(context);
        },
      ),
      KSized.h12,
      KSized.h4,
      ActionButtons(
        onCancel: () {},
        onSubmit: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const KormiListDetailsScreen();
          }));
        },
        cancelText: 'বাতিল করুন﻿',
        submitText: 'সংরক্ষন করুন',
      ),
    ].toColumn().parent(page);
  }
}
