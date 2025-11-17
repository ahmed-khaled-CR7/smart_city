// page_view.dart
import 'package:flutter/material.dart';
import 'package:smart_city/features/Home/presentation/views/home_view.dart';
import 'package:smart_city/features/citizen%20dashoard/presentation/views/citizen_dashboard_view.dart';
import 'package:smart_city/features/complaints/presentation/views/complaints_view.dart';
import 'package:smart_city/features/notification/presentation/views/notification_view.dart';
import 'package:smart_city/features/profile/presentation/views/profile_view.dart';

class HomePagesView extends StatelessWidget {
  final PageController pageController;
  final void Function(int) onPageChanged;
  final void Function(int) onNavTap;

  const HomePagesView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
    required this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        HomeView(onNavTap: onNavTap),
        const CitizenDashboardView(),
        const NotificationView(),
        const ComplaintsView(),
        const ProfileView(),
      ],
    );
  }
}
