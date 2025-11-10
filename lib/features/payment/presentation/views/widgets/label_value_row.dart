import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';

class LabelValueRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isAmount;

  const LabelValueRow({
    super.key,
    required this.label,
    required this.value,
    this.isAmount = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.secondaryColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: AppColors.secondaryColor2,
            fontSize: isAmount ? 18.sp : 15.sp,
            fontWeight: isAmount ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
