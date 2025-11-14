// lib/features/auth/presentation/widgets/name_field.dart

import 'package:flutter/material.dart';
import 'package:smart_city/core/widgets/custom_textformfield.dart';

class NameField extends StatelessWidget {
  final TextEditingController controller;
  const NameField({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextformField(
      controller: controller,
      title: 'Full Name',
      hintText: 'Enter your full name',
      icon: Icons.person,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Full name is required';
        }
        return null;
      },
    );
  }
}
