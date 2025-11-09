import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome Back!',
          textAlign: TextAlign.center,
          style: AppTextStyles.bold28.copyWith(
            color: const Color(0xFF1E1E1E),
            fontSize: 28.sp,
            height: 1.2,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Log in to Smart City',
          textAlign: TextAlign.center,
          style: AppTextStyles.medium18.copyWith(
            color: AppColors.secondaryColor.withOpacity(0.7),
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
