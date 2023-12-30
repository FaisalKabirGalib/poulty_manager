import 'package:flutter/material.dart';
import 'package:poulty_manager/config/config.dart';
import 'package:poulty_manager/config/constant/constant.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isRequired;
  final VoidCallback? onPressed;

  CustomTextField({
    required this.label,
    required this.hint,
    this.isRequired = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              if (isRequired)
                const Text(
                  ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                  ),
                ),
            ],
          ),
          KSized.h8,
          TextFormField(
            onTap: onPressed,
            decoration: InputDecoration(
              hintText: hint,
              border: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.black3Color, width: 1.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.black3Color, width: 1.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.black3Color, width: 1.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              hintStyle:
                  const TextStyle(color: AppColors.black3Color, fontSize: 16.0),
            ),
            validator: (value) {
              if (isRequired && (value == null || value.isEmpty)) {
                return 'This field is required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
