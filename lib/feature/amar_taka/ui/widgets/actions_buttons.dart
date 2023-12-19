import 'package:flutter/material.dart';
import 'package:poulty_manager/config/config.dart';
import 'package:styled_widget/styled_widget.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSubmit;
  final String cancelText;
  final String submitText;

  const ActionButtons({
    Key? key,
    required this.onCancel,
    required this.onSubmit,
    required this.cancelText,
    required this.submitText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.white,
                elevation: 0,
                foregroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(color: AppColors.primaryColor),
              ),
              onPressed: onCancel,
              child: Styled.text(cancelText).textColor(AppColors.primaryColor),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                elevation: 0,
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: onSubmit,
              child: Styled.text(submitText).textColor(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
