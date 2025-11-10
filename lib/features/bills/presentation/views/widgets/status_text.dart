import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusText extends StatelessWidget {
  final bool isPaid;

  const StatusText({super.key, required this.isPaid});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isPaid ? Icons.check_box : Icons.close,
          color: isPaid ? Colors.green : Colors.red,
          size: 20.sp,
        ),
        SizedBox(width: 5.w),
        Text(
          isPaid ? 'Paid' : 'Unpaid',
          style: TextStyle(
            color: isPaid ? Colors.green : Colors.red,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
