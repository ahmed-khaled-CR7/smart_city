// lib/features/citizen dashoard/presentation/views/widgets/electricty_dashboard_view_body.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';
import 'package:smart_city/features/citizen%20dashoard/presentation/views/widgets/Consumption_Chart.dart';
import 'package:smart_city/features/citizen%20dashoard/presentation/views/widgets/info_card.dart';

class ElectricityDashboardBody extends StatelessWidget {
  const ElectricityDashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الحل السحري: شيلنا الـ height الثابت وخليناه يكبر براحته
          InfoCard(serviceType: "electricity"),

          SizedBox(height: 24.h),

          Text(
            'Consumption History (Last 6 Months)',
            style: AppTextStyles.bold18,
          ),
          SizedBox(height: 16.h),

          // الـ Expanded عشان الـ Chart ياخد الباقي
          const Expanded(child: ConsumptionChart()),
        ],
      ),
    );
  }
}