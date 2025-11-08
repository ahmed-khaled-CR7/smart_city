import 'package:flutter/material.dart';

class SignupFieldsConfig {
  static List<Map<String, dynamic>> fields = [
    {
      "title": "Email",
      "hint": "Enter your email",
      "icon": Icons.email,
      "input": TextInputType.emailAddress,
      "obscure": false,
    },
    {
      "title": "Password",
      "hint": "Enter your password",
      "icon": Icons.lock,
      "obscure": true,
    },
    {
      "title": "Confirm Password",
      "hint": "Re-enter your password",
      "icon": Icons.lock,
      "obscure": true,
    },
    {
      "title": "Phone Number",
      "hint": "Enter your phone number",
      "icon": Icons.phone,
      "input": TextInputType.phone,
      "obscure": false,
    },
    {
      "title": "National ID",
      "hint": "Enter your national ID",
      "icon": Icons.perm_identity,
      "input": TextInputType.number,
      "obscure": false,
    },
    {
      "title": "Full Name",
      "hint": "Enter your full name",
      "icon": Icons.person,
      "obscure": false,
    },
    {
      "title": "Address",
      "hint": "Enter your address",
      "icon": Icons.home,
      "obscure": false,
    },
  ];
}
