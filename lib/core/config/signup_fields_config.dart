// lib/core/config/signup_fields_config.dart
import 'package:flutter/material.dart';

class SignupFieldsConfig {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final TextEditingController nationalIdController;
  final TextEditingController nameController;
  final TextEditingController addressController;

  SignupFieldsConfig({
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
    required this.nationalIdController,
    required this.nameController,
    required this.addressController,
  });

  List<Map<String, dynamic>> getFields() {
    return [
      {
        "title": "Full Name",
        "hint": "Enter your full name",
        "icon": Icons.person,
        "controller": nameController,
        "input": TextInputType.text,
        "obscure": false,
      },
      {
        "title": "National ID",
        "hint": "Enter 14-digit ID",
        "icon": Icons.badge,
        "controller": nationalIdController,
        "input": TextInputType.number,
        "obscure": false,
      },
      {
        "title": "Email",
        "hint": "example@gmail.com",
        "icon": Icons.email,
        "controller": emailController,
        "input": TextInputType.emailAddress,
        "obscure": false,
      },
      {
        "title": "Phone Number",
        "hint": "01xxxxxxxxx",
        "icon": Icons.phone,
        "controller": phoneController,
        "input": TextInputType.phone,
        "obscure": false,
      },
      {
        "title": "Password",
        "hint": "8+ chars, A, 1, @",
        "icon": Icons.lock,
        "controller": passwordController,
        "input": TextInputType.text,
        "obscure": true,
      },
      {
        "title": "Confirm Password",
        "hint": "Re-enter password",
        "icon": Icons.lock_outline,
        "controller": confirmPasswordController,
        "input": TextInputType.text,
        "obscure": true,
      },
      {
        "title": "Address",
        "hint": "Enter your address",
        "icon": Icons.home,
        "controller": addressController,
        "input": TextInputType.text,
        "obscure": false,
      },
    ];
  }
}
