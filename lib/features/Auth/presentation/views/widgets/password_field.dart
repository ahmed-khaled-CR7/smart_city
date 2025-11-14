// lib/features/auth/presentation/widgets/password_field.dart
import 'package:flutter/material.dart';
import 'package:smart_city/core/widgets/custom_textformfield.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordField({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextformField(
      isObscure: true,
      controller: controller,
      title: 'Password',
      hintText: 'Enter password (8+ chars)',
      icon: Icons.lock,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }
        if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
          return 'Must contain an uppercase letter';
        }
        if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
          return 'Must contain a number';
        }
        if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(value)) {
          return 'Must contain a special character';
        }
        return null;
      },
    );
  }
}
