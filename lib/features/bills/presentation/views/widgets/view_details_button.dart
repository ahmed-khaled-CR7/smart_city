import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewDetailsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ViewDetailsButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0B214A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      ),
      child: Text(
        'View Details',
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}