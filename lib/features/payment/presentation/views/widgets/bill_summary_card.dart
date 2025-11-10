import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/features/payment/presentation/views/widgets/label_value_row.dart';

class BillSummaryCard extends StatelessWidget {
  const BillSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bill Summary',
            style: TextStyle(
              color: AppColors.secondaryColor2,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 15.h),
          const LabelValueRow(label: 'Service Type', value: 'Electricity Bill'),
          SizedBox(height: 10.h),
          const LabelValueRow(label: 'Month', value: 'June 2024'),
          Divider(height: 25.h, color: Colors.grey.shade300),
          const LabelValueRow(
            label: 'Total Amount',
            value: 'EGP 350.00',
            isAmount: true,
          ),
        ],
      ),
    );
  }
}
