// lib/features/auth/presentation/widgets/email_field.dart

import 'package:flutter/material.dart';
import 'package:smart_city/core/widgets/custom_textformfield.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  const EmailField({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextformField(
      controller: controller,
      title: 'Email',
      hintText: 'example@gmail.com',
      icon: Icons.email,
      inputType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Enter a valid email';
        }
        return null;
      },
    );
  }
}
