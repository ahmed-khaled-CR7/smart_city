// lib/features/auth/presentation/widgets/national_id_field.dart

import 'package:flutter/material.dart';
import 'package:smart_city/core/widgets/custom_textformfield.dart';

class NationalIdField extends StatelessWidget {
  final TextEditingController controller;
  const NationalIdField({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextformField(
      controller: controller,
      title: 'National ID',
      hintText: 'Enter 14-digit ID',
      icon: Icons.badge,
      inputType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'National ID is required';
        }
        if (value.length != 14) {
          return 'National ID must be exactly 14 digits';
        }
        if (!RegExp(r'^\d{14}$').hasMatch(value)) {
          return 'National ID must contain digits only';
        }
        return null;
      },
    );
  }
}
