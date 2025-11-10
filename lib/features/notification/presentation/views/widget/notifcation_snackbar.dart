import 'package:flutter/material.dart';
import 'package:smart_city/core/utils/app_colors.dart';

class NotificationSnackbar {
  static void show(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.secondaryColor,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
