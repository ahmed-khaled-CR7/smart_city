import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:smart_city/core/utils/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final NotchBottomBarController controller;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(
      notchBottomBarController: controller,
      color: Colors.white,
      showLabel: true,
      textOverflow: TextOverflow.visible,
      shadowElevation: 5,
      kBottomRadius: 24.0,
      notchColor: AppColors.secondaryColor2,
      elevation: 10,
      showShadow: true,
      durationInMilliSeconds: 300,
      itemLabelStyle: const TextStyle(fontSize: 10),
      bottomBarItems: _buildBottomBarItems(),
      onTap: onTap,
      kIconSize: 34.0,
    );
  }

  List<BottomBarItem> _buildBottomBarItems() {
    return [
      BottomBarItem(
        inActiveItem: Icon(Icons.home_outlined, color: Colors.grey.shade600),
        activeItem: const Icon(Icons.home_rounded, color: Colors.white),
        itemLabel: 'Home',
      ),
      BottomBarItem(
        inActiveItem: Icon(Icons.apps_outlined, color: Colors.grey.shade600),
        activeItem: const Icon(Icons.apps_rounded, color: Colors.white),
        itemLabel: 'Utils',
      ),
      BottomBarItem(
        inActiveItem: Icon(
          Icons.notifications_outlined,
          color: Colors.grey.shade600,
        ),
        activeItem: const Icon(
          Icons.notifications_rounded,
          color: Colors.white,
        ),
        itemLabel: 'Notifications',
      ),
      BottomBarItem(
        inActiveItem: Icon(
          Icons.report_problem_rounded,
          color: Colors.grey.shade600,
        ),
        activeItem: const Icon(
          Icons.report_problem_rounded,
          color: Colors.white,
        ),
        itemLabel: 'complaints',
      ),
      BottomBarItem(
        inActiveItem: Icon(
          Icons.person_outline_rounded,
          color: Colors.grey.shade600,
        ),
        activeItem: const Icon(Icons.person_rounded, color: Colors.white),
        itemLabel: 'Profile',
      ),
    ];
  }
}
