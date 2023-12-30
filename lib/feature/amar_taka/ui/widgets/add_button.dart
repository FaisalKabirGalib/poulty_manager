import 'package:flutter/material.dart';

import '../../../../config/theme/color.dart';
import '../../../kormi_list/kormi_list_screen.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
