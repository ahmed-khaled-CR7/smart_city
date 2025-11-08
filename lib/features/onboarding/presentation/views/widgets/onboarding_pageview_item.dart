import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';
import 'package:smart_city/core/widgets/custom_button.dart';

class OnboardingPageviewItem extends StatelessWidget {
  const OnboardingPageviewItem({
    super.key,
    required this.subtitle,
    required this.title,
    required this.image,
    required this.isLastPage,
    required this.onPressed,
  });

  final String subtitle;
  final String title;
  final String image;
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

            child: Image.asset(
              image,
              width: double.infinity,
              height: 350.h,
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
            // TextStyle(
            //   fontSize: 32.sp,
            //   fontWeight: FontWeight.bold,
            //   color: AppColors.secondaryColor2,
            //   fontFamily: 'Cairo',
            // ),
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
              //  TextStyle(
              //   fontSize: 16.sp,
              //   color: const Color(0xff4E5556),
              //   fontFamily: 'Cairo',
              //   height: 1.6,
              // ),
            ),
          ),

          SizedBox(height: 40.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(
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
