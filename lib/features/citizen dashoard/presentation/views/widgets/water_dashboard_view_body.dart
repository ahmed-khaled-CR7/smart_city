import 'package:flutter/material.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';
import 'package:smart_city/features/citizen%20dashoard/presentation/views/widgets/Consumption_Chart.dart';
import 'package:smart_city/features/citizen%20dashoard/presentation/views/widgets/info_card.dart';

class WaterDashboardBody extends StatelessWidget {
  const WaterDashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InfoCard(),
          const SizedBox(height: 24),
          const Text(
            'Consumption History (Last 6 Months)',
            style: AppTextStyles.bold18,
          ),
          const SizedBox(height: 16),
          const Expanded(child: ConsumptionChart()),
        ],
      ),
    );
  }
}
