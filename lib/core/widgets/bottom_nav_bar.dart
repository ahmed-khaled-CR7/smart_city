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
      kIconSize: 24.0,
    );
  }

  List<BottomBarItem> _buildBottomBarItems() {
    return [
      _buildItem(
        inactiveIcon: Icons.home_outlined,
        activeIcon: Icons.home_rounded,
        label: 'Home',
      ),
      _buildItem(
        inactiveIcon: Icons.apps_outlined,
        activeIcon: Icons.apps_rounded,
        label: 'Utils',
      ),
      _buildItem(
        inactiveIcon: Icons.notifications_outlined,
        activeIcon: Icons.notifications_rounded,
        label: 'Notifications',
      ),
      _buildItem(
        inactiveIcon: Icons.report_problem_rounded,
        activeIcon: Icons.report_problem_rounded,
        label: 'Complaints',
      ),
      _buildItem(
        inactiveIcon: Icons.person_outline_rounded,
        activeIcon: Icons.person_rounded,
        label: 'Profile',
      ),
    ];
  }

  BottomBarItem _buildItem({
    required IconData inactiveIcon,
    required IconData activeIcon,
    required String label,
  }) {
    return BottomBarItem(
      inActiveItem: Icon(inactiveIcon, color: Colors.grey.shade600),

      /// 🔵 الدائرة الزرقاء الغامقة مع الآيقونة البيضاء - خليتها بحجم ثابت وcentered
      activeItem: Icon(
        activeIcon,
        color: Colors.white,
      ),

      itemLabel: label,
    );
  }
}