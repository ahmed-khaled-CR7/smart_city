import 'package:flutter/material.dart';
import 'package:smart_city/core/widgets/custom_appbar.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/features/citizen%20dashoard/presentation/views/widgets/water_dashboard_view_body.dart';

class WaterDashboardView extends StatelessWidget {
  const WaterDashboardView({super.key});
  static const routeName = 'waterDashboardView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightprimaryColor,
      appBar: CustomAppbar(
        backgroundColor: AppColors.secondaryColor2,
        title: 'Water Dashboard',
        icon: Icons.water_drop,

        color: Colors.white,
      ),
      body: WaterDashboardBody(),
    );
  }
}
