import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';

class AnimatedTexts extends StatelessWidget {
  final Animation<double> fadeAnimation;

  const AnimatedTexts({super.key, required this.fadeAnimation});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeTransition(
          opacity: fadeAnimation,
          child: Text(
            'Smart City',
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              letterSpacing: 1.5,
              shadows: [
                Shadow(
                  color: AppColors.primaryColor.withOpacity(0.3),
                  blurRadius: 10.r,
                  offset: Offset(0, 4.h),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
        FadeTransition(
          opacity: fadeAnimation,
          child: Text(
            'Building Tomorrow, Today',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryColor.withOpacity(0.8),
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    );
  }
}
