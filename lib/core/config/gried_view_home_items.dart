import 'package:flutter/material.dart';
import 'package:smart_city/core/utils/app_colors.dart';

class GridViewItems {
  static final List<Map<String, dynamic>> gridItems = [
    {
      'icon': Icons.dashboard_customize_rounded,
      'title': 'Utils',
      'color': AppColors.secondaryColor,
      'bgColor': const Color(0xFFEEF2FF),
    },
    {
      'icon': Icons.notifications_active_rounded,
      'title': 'Notifications',
      'color': AppColors.secondaryColor2,
      'bgColor': const Color(0xFFFEF3C7),
    },
    {
      'icon': Icons.feedback_rounded,
      'title': 'Complaints & Suggestions',
      'color': AppColors.primaryColor,
      'bgColor': const Color(0xFFFCE7F3),
    },
    // {
    //   'icon': Icons.notifications_active_rounded,
    //   'title': 'Notifications',
    //   'color': AppColors.secondaryColor2,
    //   'bgColor': const Color(0xFFFEF3C7),
    // },
    {
      'icon': Icons.person_rounded,
      'title': 'Profile',
      'color': const Color(0xFF6366F1),
      'bgColor': const Color(0xFFD1FAE5),
    },
  ];
}
