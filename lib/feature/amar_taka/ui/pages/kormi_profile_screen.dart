import 'package:flutter/material.dart';
import 'package:poulty_manager/feature/batch/presentation/functions/utils.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../config/constant/constant.dart';
import '../../../../core/Layout/extension.dart';

class KormiProfileScreen extends StatelessWidget {
  const KormiProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return [
      backAndTrailing(onBack: () {
        Navigator.pop(context);
      }),
      KSized.h12,
      KSized.h4,
    ].toColumn().parent(page);
  }
}
