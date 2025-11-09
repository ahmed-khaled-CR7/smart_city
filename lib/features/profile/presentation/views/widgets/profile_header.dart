import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  final String title;

  const ProfileHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.secondaryColor2,
            size: 24.sp,
          ),
        ),
        const Spacer(flex: 2),
        Text(
          title,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryColor2,
          ),
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}
