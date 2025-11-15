import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';
import 'package:smart_city/core/widgets/custom_button.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onConfirm,
  });

  final String title;
  final String subTitle;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 96.w,
              height: 96.h,
              decoration: ShapeDecoration(
                color: AppColors.lightprimaryColor,
                shape: const CircleBorder(),
              ),
              child: Center(
                child: Icon(
                  Icons.logout,
                  color: AppColors.primaryColor,
                  size: 42.sp,
                ),
              ),
            ),
            SizedBox(height: 18.h),
            Text(
              title,
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
              color: AppColors.primaryColor,
              text: 'Yes, Logout',
              onPressed: () async {
                Navigator.pop(context);

                onConfirm();
              },
            ),

            SizedBox(height: 12.h),

            CustomButton(
              color: Colors.white70,
              text: 'Cancel',
              textColor: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
