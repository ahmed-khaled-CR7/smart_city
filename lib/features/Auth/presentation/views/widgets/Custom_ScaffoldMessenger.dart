import 'package:flutter/material.dart';

class CustomScaffoldMessenger {
  /// Show a success message
  static void showSuccess(BuildContext context, String message) {
    _showSnackBar(context, message, Colors.green);
  }

  /// Show an error message
  static void showError(BuildContext context, String message) {
    _showSnackBar(context, message, Colors.red);
  }

  /// Show a general info message
  static void showInfo(BuildContext context, String message) {
    _showSnackBar(context, message, Colors.blue);
  }

  /// Private helper
  static void _showSnackBar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
