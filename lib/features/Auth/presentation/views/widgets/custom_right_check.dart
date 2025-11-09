import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';

class CustomRightCheck extends StatelessWidget {
  const CustomRightCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.w,
      height: 96.h,
      decoration: ShapeDecoration(
        color: AppColors.secondaryColor,
        shape: const CircleBorder(),
      ),
      child: Center(
        child: Icon(Icons.check, color: Colors.white, size: 55.sp),
      ),
    );
  }
}
