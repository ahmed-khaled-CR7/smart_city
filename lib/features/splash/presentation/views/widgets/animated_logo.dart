import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/utils/app_images.dart';

class AnimatedLogo extends StatelessWidget {
  final Animation<double> scaleAnimation;
  final Animation<double> pulseAnimation;

  const AnimatedLogo({
    super.key,
    required this.scaleAnimation,
    required this.pulseAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: Container(
        padding: EdgeInsets.all(32.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.3),
              blurRadius: 40.r,
              spreadRadius: 10.r,
            ),
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.2),
              blurRadius: 80.r,
              spreadRadius: 20.r,
            ),
          ],
        ),
        child: AnimatedBuilder(
          animation: pulseAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: pulseAnimation.value,
              child: Container(
                padding: EdgeInsets.all(24.w),
                decoration: const BoxDecoration(
                  color: AppColors.lightprimaryColor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  Assets.imagesAppLogo,
                  width: 160.w,
                  height: 160.h,
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
