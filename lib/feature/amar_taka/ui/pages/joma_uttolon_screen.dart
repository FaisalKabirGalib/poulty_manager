import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/Layout/extension.dart';
import '../../../batch/presentation/functions/utils.dart';

class JomaUttolonScreen extends StatelessWidget {
  const JomaUttolonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return [
      titleWithBackArrowAndAction(
        'জমা/উত্তলন',
        'এই সেকশন আপনার ফার্মের টাকা জমা করতে পারবেন এবং টাকা উত্তোলন করতে পারবেন। ',
        onBack: () {
          Navigator.pop(context);
        },
      )
    ].toColumn().parent(page);
  }
}
