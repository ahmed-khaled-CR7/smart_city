// lib/features/auth/presentation/widgets/confirm_password_field.dart
import 'package:flutter/material.dart';
import 'package:smart_city/core/widgets/custom_textformfield.dart';

class ConfirmPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;

  const ConfirmPasswordField({
    required this.controller,
    required this.passwordController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextformField(
      isObscure: true,
      controller: controller,
      title: 'Confirm Password',
      hintText: 'Re-enter your password',
      icon: Icons.lock_outline,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Confirm password is required';
        }
        if (value != passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }
}
