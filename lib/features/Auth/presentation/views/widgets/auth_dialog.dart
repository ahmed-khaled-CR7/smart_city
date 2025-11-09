import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'custom_right_check.dart';

class AuthDialog extends StatelessWidget {
  const AuthDialog({super.key, required this.Title, required this.subTitle});
  final String Title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightprimaryColor,
      body: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomRightCheck(),

              SizedBox(height: 18.h),

              Text(
                Title,
                textAlign: TextAlign.center,
                style: AppTextStyles.bold28.copyWith(
                  color: AppColors.secondaryColor2,
                  height: 1.25,
                ),
              ),

              SizedBox(height: 8.h),

              Text(
                subTitle,

                textAlign: TextAlign.center,
                style: AppTextStyles.regular16.copyWith(
                  color: const Color(0xFF1E1E1E),
                ),
              ),

              SizedBox(height: 22.h),

              CustomButton(
                text: 'Log in Now',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
