import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

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
            'Selected Payment Method',
            style: TextStyle(
              color: AppColors.secondaryColor2,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1234 **** **** ****',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.secondaryColor2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.credit_card, color: Colors.grey),
            ],
          ),
          SizedBox(height: 10.h),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Change',
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}