import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/features/payment/presentation/views/widgets/label_value_row.dart';

class BillDetailsViewBody extends StatelessWidget {
  const BillDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          const LabelValueRow(label: 'Service Type', value: 'Electricity'),
          SizedBox(height: 10.h),
          const LabelValueRow(label: 'Issue Date', value: '24/08/2024'),
          Divider(height: 25.h, color: Colors.grey.shade300),
          const LabelValueRow(
            label: 'Total Amount',
            value: 'EGP 350.00',
            isAmount: true,
          ),
          Divider(height: 25.h, color: Colors.grey.shade300),
          const LabelValueRow(label: 'status', value: 'Paid'),
          const Spacer(),
          CustomButton(
            text: 'Pay Now',
            color: AppColors.primaryColor,
            textColor: Colors.black,
            onPressed: () {},
          ),
          SizedBox(height: 15.h),
          CustomButton(
            text: 'Report a Problem',
            color: AppColors.lightprimaryColor,
            textColor: AppColors.secondaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
