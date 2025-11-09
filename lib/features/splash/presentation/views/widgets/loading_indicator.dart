import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smart_city/core/utils/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  final Animation<double> fadeAnimation;

  const LoadingIndicator({super.key, required this.fadeAnimation});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoadingAnimationWidget.twistingDots(
            leftDotColor: AppColors.secondaryColor,
            rightDotColor: AppColors.secondaryColor2,
            size: 60.0.w,
          ),

          SizedBox(height: 16.h),

          SizedBox(height: 16.h),

          Text(
            'Loading...',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryColor.withOpacity(0.6),
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
