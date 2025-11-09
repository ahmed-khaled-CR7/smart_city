import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';
import 'package:smart_city/core/widgets/custom_button.dart';

class OnboardingPageviewItem extends StatelessWidget {
  const OnboardingPageviewItem({
    super.key,
    required this.subtitle,
    required this.title,
    required this.animation,
    this.animationHeight,
    required this.isLastPage,
    required this.onPressed,
  });

  final String subtitle;
  final String title;
  final String animation;
  final double? animationHeight;
  final bool isLastPage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Lottie.asset(
              animation,
              width: double.infinity,
              height:
                  animationHeight ?? 350.h, // استخدم الحجم المخصص أو الافتراضي
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 40.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.bold32.copyWith(
              color: AppColors.secondaryColor2,
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.regular16.copyWith(
                color: const Color(0xff4E5556),
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(
              color: AppColors.primaryColor,
              text: isLastPage ? 'Get Started' : 'Next',
              onPressed: onPressed,
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
