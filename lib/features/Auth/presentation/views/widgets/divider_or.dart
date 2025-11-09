import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';

class DividerOr extends StatelessWidget {
  const DividerOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.secondaryColor.withOpacity(0.3),
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'OR',
            style: AppTextStyles.medium18.copyWith(
              color: AppColors.secondaryColor.withOpacity(0.6),
              fontSize: 14.sp,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.secondaryColor.withOpacity(0.3),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
