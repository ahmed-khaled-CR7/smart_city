import 'package:flutter/material.dart';
import 'package:smart_city/core/widgets/custom_appbar.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/features/citizen%20dashoard/presentation/views/widgets/electricty_dashboard_view_body.dart';

class ElectricityDashboardView extends StatelessWidget {
  const ElectricityDashboardView({super.key});
  static const routeName = 'electricityDashboardView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightprimaryColor,
      appBar: CustomAppbar(
        backgroundColor: AppColors.secondaryColor2,
        title: 'Electricity Dashboard',
        icon: Icons.electrical_services,
        color: Colors.white,
      ),
      body: ElectricityDashboardBody(),
    );
  }
}
